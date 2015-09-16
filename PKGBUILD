# Original Packager: janhouse <janis.jansons@janhouse.lv>
# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=tespeed-git
_gitname=tespeed
pkgver=20150916.54.02a430e
pkgrel=1
pkgdesc="Terminal network speed test that uses servers from Speedtest.net. It uses nearest test server but can also use one manually specified by the user."
arch=('any')
url="https://github.com/Janhouse/tespeed"
license=('MIT')
depends=('python2' 'python2-lxml')
makedepends=('git')
source=('tespeed::git+http://github.com/Janhouse/tespeed.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(date +"%Y%m%d").$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/${_gitname}"
    git submodule init
    git submodule update
}

package() {
  cd "$srcdir/${_gitname}"
  install -Dm755 tespeed.py "$pkgdir/usr/lib/tespeed/tespeed.py"
  install -Dm644 "SocksiPy/socks.py" "$pkgdir/usr/lib/tespeed/SocksiPy/socks.py"
  install -Dm644 "SocksiPy/__init__.py" "$pkgdir/usr/lib/tespeed/SocksiPy/__init__.py"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  mkdir -p "$pkgdir/usr/bin/"
  ln -s /usr/lib/tespeed/tespeed.py "$pkgdir/usr/bin/tespeed"
}

# Maintainer: willemw <willemw12@gmail.com>
# Contributor: sng <sng at hellug dot gr>
# Contributor: aksr <aksr at t-com dot me>

_pkgname=pyradio
pkgname=$_pkgname-git
pkgver=0.8.7.r0.ga9b808f
pkgrel=1
pkgdesc="Command line internet radio player"
arch=('any')
url="http://www.coderholic.com/pyradio/"
license=('MIT')
depends=('ncurses' 'python')
optdepends=('mplayer: as backend' 'vlc: as backend' 'mpv: as backend')
makedepends=('git' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/coderholic/pyradio.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname

  _descr="$(git describe --long --tags)"
  sed -i "s/git_description = ''/git_description = '$_descr'/" pyradio/radio.py

  install -Dm644 LICENCE     "$pkgdir/usr/share/licenses/pyradio/LICENSE"
  install -Dm644 README.html "$pkgdir/usr/share/doc/pyradio/README.html"
  install -Dm644 README.md   "$pkgdir/usr/share/doc/pyradio/README.md"
  install -Dm644 build.html  "$pkgdir/usr/share/doc/pyradio/build.html"
  install -Dm644 build.md    "$pkgdir/usr/share/doc/pyradio/build.md"

  gzip pyradio.1
  install -Dm644 pyradio.1.gz "$pkgdir/usr/share/man/man1/pyradio.1.gz"

  python setup.py install --root="$pkgdir" --optimize=1
}


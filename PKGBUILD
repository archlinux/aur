# Maintainer: Dino Duratović <dinomol  mail  com>
pkgname=firefox-dpms-git
pkgver=1
pkgrel=1
pkgdesc="Disable DPMS settings when playing video in Firefox"
arch=('any')
url="https://github.com/dglava/firefox-dpms"
license=('GPL3')
depends=('python' 'python-pulse-control')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/dglava/firefox-dpms.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root=$pkgdir

  # install license
  install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

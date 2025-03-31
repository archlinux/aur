# Maintainer: Steven Allen <steven@stebalien.com>
pkgname=backlight-sync-git
pkgver=r23.2067e96
pkgrel=1
epoch=
pkgdesc="Automatic backlight sync between a laptop and a monitor"
arch=('any')
url="https://github.com/Stebalien/backlight-sync"
license=('GPL3')
depends=('i2c-tools')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Stebalien/backlight-sync.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir/" build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

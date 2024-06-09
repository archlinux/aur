# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: 2ion <dev@2ion.de>
pkgname=bunsen-common-git
pkgver=r143.1f382a8
pkgrel=3
pkgdesc="Various shared files for BunsenLabs"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-common"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/BunsenLabs/bunsen-common.git#branch=boron')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/${pkgname%-git}"
  bash -n bl-includes
  bash -n yad-includes
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm 644 bl-includes                  "${pkgdir}/usr/lib/bunsen/common/bl-includes"
  install -Dm 644 yad-includes                    "${pkgdir}/usr/lib/bunsen/common/yad-includes"
  install -Dm 644 distributor-logo-bunsenlabs.svg "${pkgdir}/usr/share/icons/hicolor/scalable/places/distributor-logo-bunsenlabs.svg"
}

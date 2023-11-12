# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttyplot
pkgver=1.5
pkgrel=1
pkgdesc='A realtime plotting utility for terminal with data input from stdin'
arch=(x86_64)
url=https://github.com/tenox7/ttyplot
license=('custom:The Unlicense')
depends=(ncurses)
makedepends=(make gcc)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tenox7/${pkgname}/archive/${pkgver}.tar.gz"
        "${url}/raw/95eb2641040568e86f83d4de0b97b3033a10a908/ttyplot.1")
sha256sums=('c494c31e7808a6e3bf8e3c399024b9aeb7d77967db6008a62d110ad9ed1b8bec'
            '83df05ae00a05fb01d034e2493e99fa77b26a332aec5a31feeaa0ccdd5d97be9')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${srcdir}/ttyplot.1"
}


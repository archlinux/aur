# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttyplot
pkgver=1.4
pkgrel=3
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
sha256sums=('11974754981406d19cfa16865b59770faaf3ade8d909d9a0134dc56e00d29bd4'
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


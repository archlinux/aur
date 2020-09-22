# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='usbimager'
pkgver=1.0.5
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'udisks2')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('20ffc3720f4c806285628064d536cbf5a59f05d6fdef92bd06f9fbd694426ce6')

build() {
  USE_LIBUI=yes USE_UDISKS2=yes make -C "${pkgname}-${pkgver}/src"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "src/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "src/misc/${pkgname}.desktop"
  install -Dm644 'src/misc/icon128.png' "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/man/man8" "src/misc/${pkgname}.8.gz"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" {README.md,"${pkgname}-manual.pdf"}
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

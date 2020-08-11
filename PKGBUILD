# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=usbimager
pkgver=1.0.4
pkgrel=2
pkgdesc='Minimal GUI application to write compressed disk images to USB drives'
arch=('x86_64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'udisks2')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1dc151d08e99f298b4b1cb9000b6adb94ab765a2816da4b33c8ccc52f08ec99d')

build() {
  USE_LIBUI=yes USE_UDISKS2=yes make -C "${pkgname}-${pkgver}/src"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "src/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "src/misc/${pkgname}.desktop"
  install -Dm644 "src/misc/icon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/man/man8" "src/misc/${pkgname}.8.gz"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" {README.md,"${pkgname}-manual.pdf"}
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

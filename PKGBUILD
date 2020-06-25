# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: NeoTheFox <soniczerops at gmail dot com>

pkgname=usbimager
pkgver=1.0.4
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'sudo' 'udisks2')
install='groups.install'
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1dc151d08e99f298b4b1cb9000b6adb94ab765a2816da4b33c8ccc52f08ec99d')

build() {
  USE_LIBUI=yes USE_UDISKS2=yes \
    make -C "${pkgname}-${pkgver}/src"
}

package() {
  install -d "${pkgdir}/usr/bin"
  USE_LIBUI=yes USE_UDISKS2=yes \
    make DESTDIR="${pkgdir}" PREFIX="usr" -C "${pkgname}-${pkgver}/src" install
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}/${pkgname}-manual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

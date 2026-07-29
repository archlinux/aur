# Maintainer: Kozika <kozikakkozika+aur at gmail dot com>

pkgname=star-cups-driver
pkgver=3.17.0
pkgrel=1
pkgdesc='Star Micronics CUPS printer drivers'
arch=('x86_64')
url='https://starmicronics.com/support/download/cups-driver-for-linux/'
license=('GPL-2.0-or-later' 'custom:Star')
depends=('cups')

DLAGENTS+=(
  "manual::/usr/bin/echo Please download foobar manually from ${url} and place it next to the PKGBUILD"
)

source=("manual://Star_CUPS_Driver-${pkgver}_linux.tar.gz")
sha256sums=('1078288f8e48468a31c6ebef635fe17f7b9ab11f9ff3b2f68299f85b52df29a9')

prepare() {
  tar -xzf "${srcdir}/Star_CUPS_Driver-${pkgver}_linux/SourceCode/Star_CUPS_Driver-src-${pkgver}.tar.gz" -C "${srcdir}"
}

build() {
  cd "${srcdir}/Star_CUPS_Driver"
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${srcdir}/Star_CUPS_Driver"

  install -Dm755 install/rastertostar "${pkgdir}/usr/lib/cups/filter/rastertostar"
  install -Dm755 install/rastertostarlm "${pkgdir}/usr/lib/cups/filter/rastertostarlm"
  install -Dm755 install/rastertostarm "${pkgdir}/usr/lib/cups/filter/rastertostarm"
  install -Dm644 install/*.ppd -t "${pkgdir}/usr/share/cups/model/star"

  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
  install -Dm644 SoftwareLicenseAgreement.pdf "${pkgdir}/usr/share/licenses/${pkgname}/SoftwareLicenseAgreement.pdf"
  install -Dm644 SoftwareLicenseAgreementAppendix.pdf "${pkgdir}/usr/share/licenses/${pkgname}/SoftwareLicenseAgreementAppendix.pdf"
}

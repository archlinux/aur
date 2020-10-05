# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='nmly'
pkgver=1.1.1
pkgrel=1
pkgdesc='Bulk rename utility with useful functions'
arch=('x86_64')
url='https://github.com/Usbac/nmly'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d593cd1adb056bf61e6a7e9c72961642727229f5b00e07c0d330d8dc8fb3a0e7')

prepare() {
  # Add LDFLAGS to Makefile
  sed -i.bak '/\$(CFLAGS)/s/$/ \$(LDFLAGS)/' "${pkgname}-${pkgver}/Makefile"
}

build() {
  export LDFLAGS="${LDFLAGS}"
  make -C "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

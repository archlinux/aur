# Maintainer: zer0def <zer0def@github>
pkgname=qrc-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="QR code generator for text terminals"
url="https://github.com/fumiyas/qrc"
arch=(
  'x86_64'
  "arm" "armv6h" "armv7h"  # arm
  "i486" "i686"  # i386
)
license=('MIT')
provides=('qrc')
conflicts=('qrc')

[ "${CARCH}" = "x86_64" ] && _CARCH=amd64 && sha512sums=(
  fb78aac0b19d235502b5dd225c3bcf600464d85597433507e196af3a1ffac705241f28f19b0032dc99c5a1e99049bcea4746623d689985fa7b39791ac47e7576
)

echo ${CARCH} | grep -E '^arm' &>/dev/null && _CARCH=arm && sha512sums=(
  489f09ed5051188c97b52981d5b94023ce2cdcc678f5138df121a08c51a9defb83b0d24ab60e3a05b01836acde4ff3abd494b35c1f9c7c4327669f95f5984007
)

[ "${CARCH}" = "i486" -o "${CARCH}" = "i686" ] && _CARCH=386 && sha512sums=(
  b82dfc8387cf8ce7aa9632028ef6baea28473b86a2633f085cb9a829e25b025c8960237c095c8c2baeb7a24b6395535298736c4687c1f3c93f3bb4c05cff9d57
)

source=(
  "qrc::https://github.com/fumiyas/qrc/releases/download/v${pkgver}/qrc_linux_${_CARCH}"
)

package() {
  install -Dm755 ${srcdir}/qrc ${pkgdir}/usr/bin/qrc
}

# Maintainer: BasalBit GmbH <info@basalbit.com>

pkgname=rerune-bin
pkgver=1.0.21
pkgrel=1
pkgdesc='Prebuilt CLI for rerune translation workflows'
arch=('x86_64' 'aarch64')
url='https://rerune.io'
license=('MIT')
provides=("rerune=${pkgver}")
conflicts=('rerune')
options=('!debug' '!strip')

source_x86_64=("rerune-bin-${pkgver}-x86_64.tar.gz::https://raw.githubusercontent.com/BasalBit/rerune-releases/main/v${pkgver}/rerune_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("rerune-bin-${pkgver}-aarch64.tar.gz::https://raw.githubusercontent.com/BasalBit/rerune-releases/main/v${pkgver}/rerune_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('76e7984ba3c591d1664e03d0063be9bc742d7ad910a0b26ba1b8ea5e4ad5f2a6')
sha256sums_aarch64=('050f4efb881a63c46a6b5df134b0124cdbf553040c45e5798c5f4b2a7550d3a0')

package() {
  local archive_dir

  case "${CARCH}" in
  x86_64)
    archive_dir="rerune_${pkgver}_linux_amd64"
    ;;
  aarch64)
    archive_dir="rerune_${pkgver}_linux_arm64"
    ;;
  esac

  install -Dm755 "${srcdir}/${archive_dir}/rerune" "${pkgdir}/usr/bin/rerune"
  install -Dm644 "${srcdir}/${archive_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

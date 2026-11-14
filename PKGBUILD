# Maintainer: BasalBit GmbH <info@basalbit.com>

pkgname=rerune-bin
pkgver=1.0.22
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
sha256sums_x86_64=('02f4a46e78c1f94dfc8f44b44ea0b1b449a67069e333cbbc6a0c54b0b0089dab')
sha256sums_aarch64=('fb4dfa164e5cc2090d093360540de18c6f4d9e8b90058390da88530118d9185f')

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

# Maintainer: BasalBit GmbH <info@basalbit.com>

pkgname=rerune-bin
pkgver=1.0.20
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
sha256sums_x86_64=('6d24f9b53bb878ce83929bfaa2848871380bd6eca22ce30947b6db5d03e02643')
sha256sums_aarch64=('91b1003d787f7e8a89a251540b5e7ee65442b3e153a108923c5b9b054f94f580')

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

# Maintainer: Eraldo HAsanaj <eraldo.hasanaaj@basalbit.com>

pkgname=rerune-bin
pkgver=0.14.5
pkgrel=1
pkgdesc='Prebuilt CLI for rerune translation workflows'
arch=('x86_64' 'aarch64')
url='https://rerune.io'
license=('LicenseRef-BasalBit-Proprietary')
provides=("rerune=${pkgver}")
conflicts=('rerune')
options=('!debug' '!strip')

source=('rerune-LICENSE.txt')
source_x86_64=(
  "rerune_${pkgver}_linux_amd64.tar.gz::https://basalbit.github.io/rerune-releases/v${pkgver}/rerune_${pkgver}_linux_amd64.tar.gz"
)
source_aarch64=(
  "rerune_${pkgver}_linux_arm64.tar.gz::https://basalbit.github.io/rerune-releases/v${pkgver}/rerune_${pkgver}_linux_arm64.tar.gz"
)
sha256sums=('b0bf9b7da434db532ad6760e6c0aabfc6340047d2c264e5a4bfc82d4dd9dcf4f')
sha256sums_x86_64=('1b3d8939913edd7b615ce7773cf979dd541f7b9bc4d695d4d34617a17d7c5747')
sha256sums_aarch64=('ceb3d6e9e4972d2d4fde842835718d7eba72ffd8a65f34024784d0e493ddff20')

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
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/rerune-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

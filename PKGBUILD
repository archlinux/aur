# Maintainer: BasalBit GmbH <info@basalbit.com>

pkgname=rerune-bin
pkgver=1.0.23
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
sha256sums_x86_64=('1ef615c9865b819ff846c3ab7b913ab0d9bcc252d78d2492424d256623b635fe')
sha256sums_aarch64=('0ffc2dc5a57343e9cd20d61d5842fb991430d4a21edc23ad5bdd37dc2eb88e09')

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

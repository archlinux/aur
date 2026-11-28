# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openasr-bin
pkgver=0.1.41
pkgrel=1
pkgdesc="Local-first speech-to-text with no cloud or telemetry"
arch=('x86_64' 'aarch64')
url="https://github.com/QuintinShaw/openasr"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc' 'libgomp' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openasr-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openasr-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('6ba58937fc996444575148fa4c9eaa1bfd5674c662b0655c141334a696dea23b')
sha256sums_aarch64=('77f5cd5d8d31dead76c5b0883bdfb98037c1a784d95449f442a5ea4fa82bbd84')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="openasr-${pkgver}-linux-x86_64" ;;
    aarch64) _dir="openasr-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/openasr" "${pkgdir}/usr/bin/openasr"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

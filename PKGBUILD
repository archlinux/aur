# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=elevenlabs-cli-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="Command line interface for ElevenLabs voice agents"
arch=('x86_64' 'aarch64')
url="https://github.com/elevenlabs/cli"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/elevenlabs-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/elevenlabs-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5fb66e11b2d43f2a12470f6f2d69c871c4c7a067046fe53b7beab624489ae360')
sha256sums_aarch64=('bce295a0dbdb956bafaa4429fa7b383c566dcfb7b7b0da864448d6fdd8bd35e0')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="elevenlabs-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="elevenlabs-cli-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/elevenlabs" "${pkgdir}/usr/bin/elevenlabs"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=elevenlabs-cli-bin
pkgver=1.14.2
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
sha256sums_x86_64=('a02f54117cc87c0232711d3fe20bca2574a2720c260643cf24cc702421170a15')
sha256sums_aarch64=('bc2cb0aec67c61d27f77b9abb80e6a484742f0d82c1b626ae1306ec77b1b0078')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="elevenlabs-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="elevenlabs-cli-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/elevenlabs" "${pkgdir}/usr/bin/elevenlabs"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

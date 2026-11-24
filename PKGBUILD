# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=elevenlabs-cli-bin
pkgver=1.12.2
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
sha256sums_x86_64=('1b7a7d76058c28539c53c94f7d07b42648f270e4796f08a9bea98f6bfdde134b')
sha256sums_aarch64=('b2275583c3ca3896ed12af5c4d7071ed431f0bd31b46996fc11dcecf8cec02da')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="elevenlabs-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="elevenlabs-cli-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/elevenlabs" "${pkgdir}/usr/bin/elevenlabs"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cuttlefish-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Build compacted de Bruijn graphs from references or reads"
arch=('x86_64' 'aarch64')
url="https://github.com/COMBINE-lab/cuttlefish"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/cuttlefish-rs-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/cuttlefish-rs-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('9932306a51f3ef35f73a5e77169c69325502cf5274831ccd1fcdd89103fedd70')
sha256sums_aarch64=('7cb9f4f7264366636d87004cdae412f88e4c8748b54d548b2423a1691dd0887d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="cuttlefish-rs-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="cuttlefish-rs-cli-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/cuttlefish" "${pkgdir}/usr/bin/cuttlefish"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

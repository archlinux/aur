# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=looptroop-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="Local AI coding orchestration for repository-scale work"
arch=('x86_64' 'aarch64')
url="https://github.com/looptroop-ai/LoopTroop"
license=('MIT')
depends=('glibc' 'libatomic' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/looptroop-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/looptroop-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('843d7d9f53e0b31580d418655ae61c5748a8546845def772d765d1bf77ca1d36')
sha256sums_aarch64=('23f050ea4f8e1234325689fbfbd5507b62745272f48d9825a525deb3b9657b3b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="looptroop-${pkgver}-linux-x64" ;;
    aarch64) _dir="looptroop-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/looptroop" "${pkgdir}/usr/bin/looptroop"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE.node.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

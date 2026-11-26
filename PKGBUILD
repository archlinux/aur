# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=moria-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="IoT firmware identification and extraction"
arch=('x86_64' 'aarch64')
url="https://github.com/nmatt0/moria"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'lz4' 'xz' 'zlib' 'zstd')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/moria-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/moria-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('1660e4555620d5fd32c290ce5995f74d88baf6ec791afdb4ef06cc1293771e72')
sha256sums_aarch64=('8a541e1e36deea02d1b5c1f5116febe1dd5b7cee5befeba13af3d8b18647a0d0')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="moria-v${pkgver}-linux-x86_64" ;;
    aarch64) _dir="moria-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/moria" "${pkgdir}/usr/bin/moria"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

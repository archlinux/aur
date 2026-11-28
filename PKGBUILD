# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fastvep-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="High-performance variant effect predictor"
arch=('x86_64' 'aarch64')
url="https://github.com/Huang-lab/fastVEP"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fastVEP-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fastVEP-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e855f88d68653426f8ec528edbb98d389ef94ec68c011522e489c024a4cd7b4c')
sha256sums_aarch64=('91e6ec1d74043751ca43bcecb2cca6120fa609d3e684ca13a3ee07dd71467e53')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fastVEP-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="fastVEP-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/fastvep-web" "${pkgdir}/usr/bin/fastvep-web"
  install -Dm755 "${_dir}/fastvep" "${pkgdir}/usr/bin/fastvep"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

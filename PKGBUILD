# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=devvm-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="One development VM for every project"
arch=('x86_64' 'aarch64')
url="https://github.com/devvmhq/devvm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/devvm-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/devvm-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('fc939a651614917404766c8bf1c7f64aed8c136605e133e0602c55101a82284c')
sha256sums_aarch64=('7f5c4c5c43b2d9a24bc2c394b54d31659ad1782ff0067e5a46fd918883c41440')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="devvm-${pkgver}-linux-amd64" ;;
    aarch64) _dir="devvm-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/devvm" "${pkgdir}/usr/bin/devvm"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

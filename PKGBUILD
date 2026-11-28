# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vip-manager-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="Manage a virtual IP based on state in etcd or Consul"
arch=('x86_64' 'aarch64')
url="https://github.com/cybertec-postgresql/vip-manager"
license=('BSD-2-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vip-manager_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/vip-manager_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('0f9d118d2c1e6a7e561406749be008a9a8fca40a59dfdc53897685b8da06d2ef')
sha256sums_aarch64=('396165193e3278d53e43be75f70474500d5c2a1c954ac1b316bd8c137272b68b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="vip-manager_${pkgver}_Linux_x86_64" ;;
    aarch64) _dir="vip-manager_${pkgver}_Linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/vip-manager" "${pkgdir}/usr/bin/vip-manager"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

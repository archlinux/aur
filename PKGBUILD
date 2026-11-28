# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=issuerd-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Fast Keycloak-compatible IAM server"
arch=('x86_64' 'aarch64')
url="https://github.com/issuerd/issuerd"
license=('Apache-2.0')
depends=('glibc' 'krb5' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/issuerd_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/issuerd_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b53e55b11e3d336730d3ca6cdb5ebbdde99459554aae599fb36221eb53be5782')
sha256sums_aarch64=('01dd887306053fa42fd05e7aca488c28e815f64f9aac3b6ea0f7725d1c7c579b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="issuerd_${pkgver}_linux_amd64" ;;
    aarch64) _dir="issuerd_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/issuerd" "${pkgdir}/usr/bin/issuerd"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

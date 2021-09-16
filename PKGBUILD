# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.22.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "kubelet.service"
)
sha256sums=('48c8f5a6a13d4179fe156f4813167a590177cfdda73c1b9681fec7e3d159b709')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('941e639b0f859eba65df0c66be82808ea6be697ed5dbf4df8e602dcbfa683aa3')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('f5fe3d6f4b2df5a794ebf325dc17fcdfe905a188e25f7c7e47d9cd15f14f8c2d')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('0fd6572e24e3bebbfd6b2a7cb7adced41dad4a828ef324a83f04b46378a8cb24')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubelet"
}

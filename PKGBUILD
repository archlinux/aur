# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.20.2
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
    sha256sums+=('fa4e9891c25830cd2b5ed52b524878d04554094a0578e039c2b3c28ea85a5b12')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('2b2d8e567439500daa9be88c4b10ee6db7126be942ac94259b506152ee38da1e')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('2447da8e0729ac6e4bdcb1ea7d41c8ae6e5c8565edea189434286697ccdc8d85')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubelet"
}

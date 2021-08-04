# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.22.0
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
    sha256sums+=('4354dc8db1d8ca336eb940dd73adcd3cf17cbdefbf11889602420f6ee9c6c4bb')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('cea637a7da4f1097b16b0195005351c07032a820a3d64c3ff326b9097cfac930')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('fec5c596f7f815f17f5d7d955e9707df1ef02a2ca5e788b223651f83376feb7f')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubelet"
}

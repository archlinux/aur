# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.23.0
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
    sha256sums+=('7417fc7cd624a85887f0a28054f58f7534143579fe85285d0b68c8984c95f2ba')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('a546fb7ccce69c4163e4a0b19a31f30ea039b4e4560c23fd6e3016e2b2dfd0d9')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('4756ff345dd80704b749d87efb8eb294a143a1f4a251ec586197d26ad20ea518')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubelet"
}

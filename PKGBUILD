# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.25.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin' 'conntrack-tools' 'iptables' 'iproute2' 'util-linux')
conflicts=('kubeadm')
provides=('kubeadm')
source=(
  "10-kubeadm.conf"
)
b2sums=('074744d327227c32661befcff7651209438090fbd75890ad3b5a32ada1fbdf8901dbd132c7093ed353901f1ea7505c97089a5a89a104f57cb7f53a342eecc7e8')

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    b2sums+=('f40a462b16b27b951d84914ff326d9de2a2a3006931965478f5850983a2b197e36a65e4d0671a06c1b21d379ba8391daaa8870772248edfd02e4f81038a87580')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('854e1d3b0c459b50edf9cfec777745c912b4e1f860769565062ed3541225f17b6dbce9c292d72fa73c4169d94a4bc26e470124f51345204bf506068d6ba4096b')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('264e34b788dee241d8aac28fce52425f69f428122466df377c07aae10d98ce16287585a6327f8450ce6c8a994a6d5a1a01b8ecb4a8bdda20d6b77dd292a584d7')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

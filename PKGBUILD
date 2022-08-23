# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.24.4
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
    b2sums+=('00403a5ddafd20bde1d992ec59b2192f4af608317cd600444b76f008ff8214a02498790b495a6ce2581a5baedafd8b0939e7b04852f092b14142fd1224756aaa')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('ca760eb0a9c59992bc5e6e91bc3b04b5987eb357b26befcfebf024d85b9830417129a138557bd0c8e3121882b48e0c92dee5c7870cbf760be17f2dd1ad311d43')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('6831df05ffda1d2662cf082338574b2f7b6bb346f55815d91429b761a675113f712914ce9f8899d2bdc9b63a56d3af5eb3e126a62019b7a654fb7df4321039ad')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

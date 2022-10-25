# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.25.3
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin' 'conntrack-tools' 'iptables' 'iproute2' 'util-linux' 'crictl')
conflicts=('kubeadm')
provides=('kubeadm')
source=(
  "10-kubeadm.conf"
)
b2sums=('074744d327227c32661befcff7651209438090fbd75890ad3b5a32ada1fbdf8901dbd132c7093ed353901f1ea7505c97089a5a89a104f57cb7f53a342eecc7e8')

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    b2sums+=('ad1fa6ea89e84ffc83e172dce14586b972ec37e2f2bbac181bf1a3f8790948687bbc6783fbdef75c3cb51c0d40d7a64477e2e5d7f193a94167e2f4695634868f')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('666ca56bcacc000e3b9ed12724c87c61cb187e9dbe71f8d0fe71e15533d83748e537095661cf8f5fa79b685100bcc090c382be83ea07567a49db98481c187613')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('0ae2aa8b8844b430ce35372d07a9d1cc99b9790656e0cb0fd2022cc207c9614fb12c3ccb103d069f30636f524e75b1636e93f037017e4d2359ca2335ef6ae124')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

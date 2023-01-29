# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.26.1
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
    b2sums+=('c7cfd1a3869f9a68952cb85b0137d80bc400d569cc906d7d15007b541a165c265286283e6035ace33945897c98595a5e40f3d8b8db46641a27719a3dee6914a0')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('2cc8278a1197c37f843c0b2f07d730b2c127945d44a43af81e6aed0786ebea08d06c80de35f275fa6fa1ff0b85566204a5712c5b893db4d653c9ad67b0c5b37b')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('f761a499295b6ae68001003c5cf6acd8f6eb6e47254720530f064c4880dfcec2218299a4b72e8b79e1943c656bc1e93d995d109ec2d1d45f59ef6e2fad78b3c2')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

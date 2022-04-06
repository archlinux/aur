# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.23.5
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
  arm*) _pkgarch="arm"
    b2sums+=('f8895ff240d10e8dc3aa0cb2689db0deba90df0111e9c04ff30da5b3f697364cfb76229d036a7be3daeca929105df67d3b71f00c69a03221bffe3ad863ea572c')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('f993249edbee65be772ce05f33bd05f2076d9e49cecf862bbb40bae741feff79d8ccabd125009219633f142d486d5c251d0cd7f39fef8db4e057e445d061296f')
    ;;
  x86_64) _pkgarch="amd64"
    b2sums+=('57df85d1e20dd5db6b218e9d6ad2def7e0857389e8770bfa0c9023b804fa7a8e6cf5e6df374dc446f6641c34543c076d1fa6c6c6eaae678a73292b7142c6078a')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

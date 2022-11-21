# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.25.4
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
    b2sums+=('3e8c2f52e8778cc1806d43c6b3fae620a8fdcd16e40fd817b9169e5d677524515c6f640e74c8cd698dce50cd7f53805af6b2948fc400dd1e9b9f83ceb8e950b1')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('3b619c89d11c176a88421f7c21fc69dd5cc4979d79c5611f39804d618aa735bd2423ef071f26eaed09ff2d11956fcd4cfeebdbbe43b6bbe0259bfd57d7fb2051')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('4ba210f1f0f8397de407e1772c1e4db39d9a6232ffdace69aecdba841fd9fd0a1188971ad7d79df26ea92dd4b754030391e060cd4497168883d07b3b4bb7624f')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

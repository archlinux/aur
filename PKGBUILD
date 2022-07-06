# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.24.2
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
    b2sums+=('69291387afa653c26a7849819778354cafcb570520380611719672bdbb7b243662ab155d934c047f797bb36af16ccc31fc610a4f1abbca245ae5ee41b643892c')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('6d4f858543c46c8a035446f854e3c23435d6fbbed28254babc306bd1a0f9d9e9bd3a6d3c2a68a7958b7b431ac151f8e3076fd68791be74be9e756569666a5285')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('19c4da80c4749547d296872d2cca724b5686607f9af4da3ec86dbd0628bca19c378e9b1b244a0bdc3cc41a8a4d853acfd3336f9f850ae1b2c00e783ace79111e')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.26.2
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
    b2sums+=('1eb4aefa8aa070c76241034368a781c92eb56df06f33ce5e9a710cc860aae5f775b3739896d396f8c56191e490d90c81a9118b4c9c13248b0262465e311e7f0f')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('31afe0b11361e83acc7a7efedc1de5ecdc3377ec478d117370583eff95c1eed72fcbabdc79776f36ecc0004d6afa2dcd09e5854bc286e401839ecbe987c7a119')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('f0c21ee2fe6702bd0c6a5b72a8200cd4e549c2a92a92ed588de057966251b20e06808c49486c4a8696178e90d80434901569c41c25d89254aa95e4c0ed03f115')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

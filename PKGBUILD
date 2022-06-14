# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.24.1
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
    b2sums+=('b28546dd8728947a423a28df9e2ec669d4ec50b15ca935be38d04249e82e7c0999e45c16c4ec2d8f810c75dd92d7ee165fecefe57c6d950bd29077e661b5d58b')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('0adfc492cf1f7e82a9144d1f77e2627eacb87ea160697d3f62ed2e3d7b6550faae894bc52e31a465a6217a518c6deec22d41289851e570e40aefc23d272160c4')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('ed1cf39334b9fd650b84390bcce06bcedd7c635aa6b2faf479c83a13061b6d02ab48d47468c1e92e5354e65308a455bc950f41592fcad36564f9a7e693b3222f')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

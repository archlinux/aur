# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.26.3
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
    b2sums+=('cbb6af9991a59786bbc6d52ff939453bdb92b950421b582e93765eb0daed8196f5917fe3c2d8e5e768d8d4356980b28c16f94d276aab37538a1fb03ed8c13236')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('569be89629c46ead75a082d63fbcc14511cb86afeb7556c18af5d65c19ce73c861e621cc5376ae38c7b3b72ed07a82fa52ae63b0f2400b9b84e25d2db4e1ff7f')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('045903e3a589a5112b0aa398d4d7c475ef4686a0aa0854b38356670b144b8887d2470cb4e3489421d8191f759fc648f0d76094c072b901f0adf952c0bf648716')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

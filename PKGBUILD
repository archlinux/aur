# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.24.0
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
    b2sums+=('564d0f63b6ef237e92bcd1e9ccf434efd8414d8e462d66e59ec75ec875a6ea4c74dc468afa20d8e615f11d1ab19993e7e35b2a74e7d218461c44cea47a6e3498')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('6e10653ad3161746314459b090a7c368a6b5f3ce7efaaf85e4c5dec8fcedde33e6b47d80ae10858663d3d886480fc93d961f93e314582e7ad142f0087aada557')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('82933a24f57d5772b8373d79f93b6897268af29ff5414225313e883b3998d574e6316818fa24defbaa274317d6822cee1f6aead777b9d4b56448612067702f3f')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

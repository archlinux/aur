# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.25.2
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
    b2sums+=('b9e3f05ab8001cb78d81ddfc6c3c644635dc788ab44032d0f59374d2a9d9323efb57052e442b4a57fabb32844992f9ad167ac2d6e880da96725bfbc83b8d67de')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('8282bfdab97c5e32b27f5d432af8173f23087800b22724f21db64489509f7042ecadc2a7a3c9d869f36e55a2719c8d57b915e95a83cb0f98aee7169edf412c69')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('68d9aa7db4dca115f0956fea1a30f16a19f1db5adc23d91582010eb5f42fcad7eee391bbc346f349771dd7b9ad5a240f6e5e9771018fd5b9e0e4493825143bea')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

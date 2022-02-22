# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.23.4
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
    b2sums+=('a4ae05eb1a7c09c16a852926e9146d2f6b467392b616d012285aa86277b439447c90d3da04cd4a464d525b4ffc2147beed48c5301a137ba3239dbc985e269c8f')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('cdba4e610f3555d4e49a4b8fe3a3b3a072cdd911c1c229aa848dbe235b198f5a0b85975fe93fcb6d1c7570eb979cd473b28e4dc631d3bb204f506db8fdca5e27')
    ;;
  x86_64) _pkgarch="amd64"
    b2sums+=('931aec6da06b60e00e0fb93030ecabbf334cf7244457852d65d8a39f4a0498832d6f600cffc4c8ab953831aa37a0bdcd41062cd5ef92c8f233aa93da0059bab7')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

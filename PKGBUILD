# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.24.3
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
    b2sums+=('3aa5c321436eaa3b5d132f5123a907a56a7a7969c4b218b6a06c4c4b7a5d09401bd78b2219cb923e59554a9d01409620b189eb64f0410e704352abd56255c479')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('d22ee2a8b9658b9a624476db966cc5dedb244027440dbb4d34770d73d937ab6090e777c5eaa3135f300eab0c65543e4c162787cb1c4bd77b4645eb407b813520')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('2e5a1d00b27f13d4809467ac1f0be82768f3e850d873dca6a509d28ead5195169a03ac936eb04ffb7e95300394be77a881f67a78331c54b3db31903686a3bd84')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

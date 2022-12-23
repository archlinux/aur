# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.26.0
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
    b2sums+=('a363cb623a1fe53616749abe752fa51377c8fae1931ffe1fb4b8bb024a19bcc9c29d5cc445d9de190dcc3a5b2c6602cf15a96a46749392aeef728ba522c12101')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('89e8aba9a57580704b94a3008a5c27cd6e701cb8ac4e4e3a9bbe6011e2bc7689f9119628fa1912a1c9c4fcbd2f35bc0d9a65e0883d23ee212a3e81f6f1e26c50')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('638cdc84c741c8929ae21db1bd5baff24105cee99670359b236045f3c7871cceea9f91d8ceaaedbfab9ef2526ea8fba3578996462c3dbc06ba032a5fe5aa9e05')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubeadm"
}

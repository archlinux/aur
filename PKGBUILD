# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.17.0
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubeadm')
source=(
  "https://raw.githubusercontent.com/kubernetes/kubernetes/release-${pkgver%.*}/build/debs/10-kubeadm.conf"
)
sha256sums=('8af7f7910fd8710ce02af03170e109c6dc6d4d74eb2cc06f90530be4f0090b65')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('5fcf1234d89bc2a364c53b76b36134fc57278b456138d93c278805f2c9b186f1')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('0b94d1ace240a8f9995358ca2b66ac92072e3f3cd0543275b315dcd317798546')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('0d8443f50fb7caab2e5e7e53f9dc56d5ffe55f021ec061f2e2bcba0481df5a48')
    ;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "kubeadm" "${pkgdir}/usr/bin/kubeadm"
}

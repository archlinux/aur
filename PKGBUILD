# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.17.2
pkgrel=1
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
    sha256sums+=('c0a74989da367d9c11b25d4fbd90e8d3d1a013a63c9be7bbce61b320715c1a83')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('091864574d38d3e30ed57734419b55d0957f39291d6f573ff8fffc8d474fb9ec')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('33a1d8e3cea2bdbb9fa9cb257c516289ee50d957fcb6d7b35919f5f0e6ca2f41')
    ;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "kubeadm" "${pkgdir}/usr/bin/kubeadm"
}

# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.16.3
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
sha256sums=('3b6e4cb3ac34a6df6dd60ce45c9ebf035fc3ec160dc001b28afb7cca1c11ef06')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('ff0bdab35e6ed3784db0db1022c94efcb89c5d6da314a3d6b811af3cb1bfb06e')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('e9f8e806a4f18a6970d228e0434ce1ba976f6a0fde2690c6a3b1e2d72f23eaa0')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('acecd15cf5471d4870959020022676e14cb6901f3c8f97019e5faee8ca956fd7')
    ;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "kubeadm" "${pkgdir}/usr/bin/kubeadm"
}

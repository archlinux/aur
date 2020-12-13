# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.20.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubeadm')
source=(
  "10-kubeadm.conf"
)
sha256sums=('8af7f7910fd8710ce02af03170e109c6dc6d4d74eb2cc06f90530be4f0090b65')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('38829599cfcab3274e9cf1aff942db06d7ec091510399722159fa3fa49a6fef0')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('16faf8bf3c94cb21dcae131cbfbd0961fc5fef37cb7e37f872ff249e235e0f46')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('b0ef92da9901670437af869e88c2799512bcb858b886207a081882795567e807')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubeadm"
}

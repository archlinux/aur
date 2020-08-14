# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.18.8
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
    sha256sums+=('52ec1a5d8a6826762c112d55734e35cf895a02e746b8d6ca4a9c942289aab077')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('71f6d95f165a9e8066c6f299217af779829ab3d798f6130caf6daa4784dc0464')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('27c8f4d4398d57762998b157d35802a36a7ea9b2b6f9a363c397a9d65b4f3c89')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubeadm"
}

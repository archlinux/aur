# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.18.2
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
    sha256sums+=('c3558beca26c1b970cee8419dcf24f9812483f6ef384cea9a704491bc3af1e2c')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('e5a1f738443c15f5f8f3b316c6c7f8038f84f24b5d4bf2eef5bee39ca208952a')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('290bb6acb12c844f76affbab1ce374903bd97c4f19ac8cd3e6fdb7208d638ac8')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubeadm"
}

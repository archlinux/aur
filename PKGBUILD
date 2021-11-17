# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.22.4
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin' 'conntrack-tools' 'iptables' 'iproute2' 'util-linux')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubeadm')
source=(
  "10-kubeadm.conf"
)
sha256sums=('8af7f7910fd8710ce02af03170e109c6dc6d4d74eb2cc06f90530be4f0090b65')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('5e52ee3c3f0f5bffd9f0d9e7b3e215b5ab239feb425d47d8bd609bd4b1fb1d61')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('3dfb128e108a3f07c53cae777026f529784a057628c721062d8fdd94b6870b69')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('33b799df2941f12a53ffe995d86a385c35d3c543f9d2c00c0cdb47ec91a98c5c')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubeadm"
}

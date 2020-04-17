# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.18.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "kubelet.service"
)
sha256sums=('3ea2a2c44642a584d9ae603fd4dccd401b06bf82338dba893c82a3ed41401a29')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('b7b9c43851dde9cbaa2061828410c60ee63e53fbf3ebc5559b7f4387dae67bb9')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('89b5066ae17df8488c76a83c70cbcac0771fa36803e31b826f2770b5efcdbfbf')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('bc13d29b58300c328f0078c7f72e37e1254c4303277348862af1e7f2b356b9e3')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubelet"
}

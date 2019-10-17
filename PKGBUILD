# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.16.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "https://raw.githubusercontent.com/kubernetes/kubernetes/release-${pkgver%.*}/build/debs/kubelet.service"
)
sha256sums=('3ea2a2c44642a584d9ae603fd4dccd401b06bf82338dba893c82a3ed41401a29')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('3c251cd89d83bae5dbae534a7c2bfff09a8ad09e0b0eac02f93a580f471631a7')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('c155ef87b6e73661a3f5de51d1f60feab4aebbade8f30bba6cf2e66fdc5f59b0')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('0c24425d7cc029bffd86bfbedcb6a63cd42c21052c3248e43918ef15d3fc03ee')
    ;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "kubelet" "${pkgdir}/usr/bin/kubelet"
}

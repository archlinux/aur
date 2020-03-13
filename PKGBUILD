# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.17.4
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
    sha256sums+=('c8c4d1b869c72b4203024615cafae1cca7df2fb89dd7f4a524d05ffa5edde559')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('77ca08cd3d03edda8d628e39a8cb45afe794582a9619d381ec5a70585999721a')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('f3a427ddf610b568db60c8d47565041901220e1bbe257614b61bb4c76801d765')
    ;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "kubelet" "${pkgdir}/usr/bin/kubelet"
}

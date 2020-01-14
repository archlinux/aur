# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.17.1
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
    sha256sums+=('0219c940bad3238dfbdf8e4518241d861bbdd8fc93d172cc632c225d7dd57094')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('c773512ade5da3188ed4c312d5ba01bfbf3f376f6e580e5b074827a5b25450aa')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('ffd04d1934c193fa63b3fc7d285d3646ed215f07f726390eefb0913b810716c3')
    ;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "kubelet" "${pkgdir}/usr/bin/kubelet"
}

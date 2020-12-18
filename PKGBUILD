# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.20.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "kubelet.service"
)
sha256sums=('48c8f5a6a13d4179fe156f4813167a590177cfdda73c1b9681fec7e3d159b709')

case "$CARCH" in
  arm*) _pkgarch="arm"
    sha256sums+=('576d89284c8fa758d7d34d789444e9a5a03f24b6400cc94bf103c1c796898dc7')
    ;;
  aarch64) _pkgarch="arm64"
    sha256sums+=('359025e549ec6e16ffa1aead7312934233a983a918f54686a2c34ff9a6ba6016')
    ;;
  x86_64) _pkgarch="amd64"
    sha256sums+=('2970974fa56ee90b76c7f3f8b0075f0719bb9d645aacfcef85238b68972aa9c3')
    ;;
esac

source+=(${pkgname}-${pkgver}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/kubelet"
}

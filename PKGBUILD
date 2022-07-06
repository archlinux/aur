# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.24.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubelet' 'kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "kubelet.service"
)
b2sums=('edaa6c5354476c2047d75c0984321aa2fa92dae715c15555b6923fe08a88bfdebc94a7e72bc87c3f187ae98fd9ce1c257b9a7a9e1b6ef36a5faccba1946d4835')

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    b2sums+=('48e027eed4ee62fe4876be0e781affe3f6a6173e6c2a97715a3ae14b6a177304fb4b36d0681a06be4fcd6d30fe177806d5a20f89dc7a06f0bac89f3c8c08df98')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('fbf61073be33f055f136d5491af4a35efb7e4ceb4ea22bb4471b9dde201828a4bb50a8068fb0ecc1bd1778822c9c87e728cba933dc9c40ed7b7a50ac9f4a7987')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('13ed2826c432cd1f853d84b556c550a5e2ba791e122accb7c1d173720ff48c7c86d5ffcf3e4bb806fe395a15fb3d7d2f6183270049baf203499d6157932d036c')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

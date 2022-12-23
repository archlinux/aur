# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.26.0
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
    b2sums+=('1782a731fe5ec953681d7f32cef44fac2e6825d7fbe61cf9af9f4a504c7ef2f36efa5c68b7cf460a162e1990e0155c957e1f771b28ad814301797f37fd28ffdd')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('89d0192b3421a78fed6e43d6689b270881142345cb38ecfae9a3c3e05beeeb71cf1ded21b7d4a2f47f2676f534bc0dafdfb07b83f355ef6d8ff7d1aff61be2cb')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('d545d33cdf0edb2cae4e4acc7bc9a96393b4cf20fd944835f74db7250f0c69f1a904f8a56e6325bdfc09c8f8f662a7e2959ea329f6137ea89f27100bf708515c')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

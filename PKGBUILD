# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.25.4
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
    b2sums+=('48ea8789d32fdd98e6002bce5cb762cc12f4d2ef8ff0161ed5235c4718050fcca72a010029fa357e1e5d4382b2092062ce6024afba3ba3bad6ae608c266edea7')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('f753d2ebdcfddc9a72905016d689d92ac02c837371ca2cede939f3efaf96765a1f175cb8410e058d9974440cbc948e3c68545770aa179f54bbc6a3907dd61647')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('5b7b791686c3593a8cf172a37c92fb6349a4273e559a5f55a34426917a93fda432a2a557f09eadd2dad15d6d9359d5bd65ad6adc591a5794ae076e41cd519208')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

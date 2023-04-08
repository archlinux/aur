# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.26.3
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
    b2sums+=('59fb11e5a37b2f8c651c38fc66182755eaedfd5f326bcab9ddd69e68a09eaf4e2e0f840a1f337c3d74f40113480dfbcfd6aed85f9098e0b1ba69348881046f17')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('b76012141b7f791acaff217492ee5c0f7539697a8bbd4ab51d7d4c4639af3452e805d38b4f1d581cea0e6c6bb44b85a8a646dc9ba347f7b896a8bcde3494c96c')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('2ca67847ac5c27ce5ed44255837a1c32b9a14013d69670c8cf4423ea5be832f6bf44a863196d04fecee98146c772ee195abd0a82e2388ebd7eac7be32abec544')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.25.2
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
    b2sums+=('a0bc7ff61f0fb006b8224d9a9a84c775898adebf17a84024e880c6158dbf9df7f9e1d188f88b4788bd8c5b148a024aaad0e29df053e837a7399552864cbdcf1d')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('a89dfa6bf809f7f45a5dee658cf6351e5f39136870a6ec82f7d1295847ea647016bc529dc1457819482c92d6139a2359d87061c9ce525197f4e7b1da43e194e0')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('84c18907e7c1cfe3f2cabe7fc2494b9e3d94844a04a9178f0befc9ce87f577c5709d4ad7eed184791708a7d71ba0d076ae82d5894c71a62ad4217b75d3797407')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

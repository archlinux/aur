# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.23.5
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
  arm*) _pkgarch="arm"
    b2sums+=('b7a3715a83872ff542a25849f39bb7e24260a554ca77c33804f2b291806b44dde20eee95df4aca7d1c47a934ae74446ac39ce285ac9550a31b9c692de861045b')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('042247f3503e5581af9ca8f74c559db253f4bf5cb078d6ea80039dba18c908d0d3eb78b24f6e120c7e7b68542f97e0dca92183549cec20c2729aa13c737ba538')
    ;;
  x86_64) _pkgarch="amd64"
    b2sums+=('54dc329300afded085948edf5e54f3c86325250dfad3bb124d458e81bc1df8257110296766fb31f052716884c6da34dd20ad07c5c1daddc6576105e60e87d29e')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

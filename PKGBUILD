# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.23.4
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
    b2sums+=('3c9bdbea89772b08bc051cab2ba6e215063bd940edd2561ffede87305732876214795fa7cf46c7db277e6af51da26cd07a556edc7cab53472ab0e9806552fd3e')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('6229ba4ac3e3a149e4059e6735f292a8f62951c8a9a8917213a788bbeed77d8cd06c1e20aff88a348d8f829752bbfaf18797db628deac14987c4cb80d4d97a02')
    ;;
  x86_64) _pkgarch="amd64"
    b2sums+=('f59dbcf8f02f3301509e1aa1609a60d609436103e1552acbfdcf8926abd3682abeec3a43832fc88941c7033b8910e057b528173ede3bdc902cfac860b1bc6a0e')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

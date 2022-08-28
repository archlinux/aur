# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.25.0
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
    b2sums+=('3113f6084a342e64caa675910a9594e4011bcabd5b7e19bc25c172fd51644956dd4a2cb37dcf6edbd41722755e708a394d307a25344ffa27c1e319f65fac126b')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('de885646fca3a440bef8ff46879fac89ab765b74e87696fd9e904078ee328803644be9911aa8ce1b3395b7c04195a7aa956438ac7e52ccd65ebbbb5481c5dc59')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('b92cdce7001147862ac7f3d9119c35b97c30cf9795c7c10c6d5375ae6f921250412800938bbb2127fe350660710350eb89c23b33c4d048f3c1e9f6282ba82d29')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

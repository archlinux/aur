# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.24.1
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
    b2sums+=('6e091e5bc1fea1e76f44206c4527f686f05620605cf8f1a7e65da91fb5c25cf931058093ce7ecdb30f2cba2461e05c444fc909459b90098b9cf8d5932f284d02')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('270a44542eb3cf8c1851a6a20a347383c9a3e913304777fb635fa06147e14bbf6fbf6c989ae80c318ec903cdfd6173575d4c65d30babf26b33355f955dd81e51')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('82d32abd41039075e8ccbc1bf35414b015ff01964e4cde830277b4838ac083860fb87b584c36cdff0fab90d7aca1146439bfe08a7b68cac449144ca5a68e1859')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.23.6
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
    b2sums+=('1c7ba78a65076bf2206ba81a32754914043ca9bd74256120e45f499c3a8750611c4c1edecacdf31b100ab841b6f9a39aff0094b7bb217b97ac4e625f3b945829')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('cb0988efeca34b015f933febb2dedd664354980847eba0fa03ce77dc9c4607072091651b8b1ab3de71491a3b3b376f9315672eccc5f1a76fdb29b6b756e38000')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('ca9b6de7747c7fd1fd1bef259608d8c9c8247938e2ab83cd0aa9db3e80696b64568a8f126a59f14ecd937c2cd910b6a5e53bf4b035a85d0f9bd3534b150f7367')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

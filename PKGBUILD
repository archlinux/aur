# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.24.3
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
    b2sums+=('312adc39fc13d0a2dbe41d522a2c6ae89a7b21b003f20f176e19ddca37a13a5c1d90d9a1009c3784e6180925c7297fd96d47411f013ac03de78e963affc5f557')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('af87b9d8d5528adb552e05b8df9dde15ddc97c27ce9b112f7daeb6ecbfcc14d04e16e2af751d69079d949b9853813b2de119be67eca7a7c9d01bb6e44355482c')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('020cd238c64bd9a474e294e7451f1b419e7b5f12ca5949e71f9fb8ad5bf1dc18ecb4700175f577158186faa1e88a14ddcacd18357e41949201ef5b6786564c55')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

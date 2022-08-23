# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.24.4
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
    b2sums+=('f16c845bb285a7fdf6904779548324437b905b35b848eb897784abc79b507c3771660f8a85d7213b6a6c2b98d9f0c08be131ef283fd8807c437932406a5a7ea0')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('da3f24d4a3a262c812381b1095c1ae71c0c45614b315149216d70011fe121654f77ddab88933e2d96fc84c0468a66f79dc9d482556d9b222eac3d045a64e7428')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('1ba6cd25adeea0e1a49d2f75d15baad38f51cd240511a8652ff2d33ad7ea5934e45e5e6b16a47ab2c327bdfba16f5af3513486c816b5b73a906522eefc408477')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

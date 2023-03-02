# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.26.2
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
    b2sums+=('a5f82e478cd0d9a697ff5855de7a0cc1cef7f257d958184ef765bcd3cddb92d08ace3c0f45f681a6182d6c1e7bdb570a1614e38a07472abe598add78fbc88206')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('44c553fbba33c8d96d685a920f849fe7f84ffc2201ca6f2025b6d22347d5c97491a78c2e5071fad5b958c00b7d243c8f6b672f500b6cc049d62c00668332fbb9')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('3f73036f3d0b1e586541e8cae600b674d00a1d97ca16d33e7ae2bb930458b56032bff01747499a700812fa79867a5b9b372b691b6ec8c02c8f40ef968137f0e8')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

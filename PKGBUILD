# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.25.3
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
    b2sums+=('10509cca60c58e1b4c2c41adf36e25e7c96f9b63414bbaab7e9fc83ae94f828272dacba82924799f3aebcb31bb6a63530f819da6c277e8a561bcb0982df7ae00')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('b719a28b07071310c0bade5e0a569ba18a215d70fafe633339d4768b7bf91c91bb4d68f5bda986569235ab6d7134e122dee8c5c7c44abada28252ccafbd04227')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('626aaee63f60cafa46dac44c815542ca4b8a6e07caefdd9de25c17e505d28b3cfa321f41f582438b863c500fba2123110e198d022dcdc46a49223e7d5756d373')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

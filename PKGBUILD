# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeletbin AT pm DOT me>
# Contributor: Paul Nicholson <brenix AT gmail DOT com>
# Contributor: Wes Jackson <icebal DOT 7 AT gmail DOT com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.24.0
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
    b2sums+=('bc008f11431f14343b3decb9b0b81c849e184bea9fe8c14d2fa8badbd42a31ba9960e9ce4e412a2546c2e1341a37e9055f684a12f662d9c7dee23e3972460795')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('9f51c683905e7969f0a81e029a10ca3d872b70ea5d7569239f93083660c241c5521d42924a208d17e6d7f6de33a8481c63e0c3f794d6e257f2e3bdfb706033c0')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('ef0406934a959e9fa00005989df334c5846755cba1971942f9c9615b3c058d93e4add79f61f4b2547c6e1c9ddd3a5e05fa0201ba5de1841a6dc319abd2f9e17b')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubelet"
}

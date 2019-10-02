# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.16.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubelet')
source=(
  "https://raw.githubusercontent.com/kubernetes/kubernetes/release-${pkgver%.*}/build/debs/kubelet.service"
)
sha256sums=('3ea2a2c44642a584d9ae603fd4dccd401b06bf82338dba893c82a3ed41401a29')

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('605581ba04a1e971dd90f4741495ebc6051601144d03b03c63e2f22d03556b4b')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('d056f403814dcbadcbb9f6be0db20295c04b7fcad6dc13c145b1a51bd1a927a4')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('29a66f72ce8bf4b08eec868953cc9c179e0f2319a52480d3c1259a24a24a9eb3')
		;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "kubelet" "${pkgdir}/usr/bin/kubelet"
}

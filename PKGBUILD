# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.16.0
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
		sha256sums+=('3158e95f4b78b12af0225b4c54c487d7926ac61c783a4646290c0f3da0dce5df')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('64bc4b211f05246f8ec33318db68a59ecc1ba7f1a6716eb1db7f3e0ea3495ca2')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('77ac3f347497434b790aba46e6e06bb2e6e7a6e76b05af739d33b0441d39a263')
		;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "kubelet" "${pkgdir}/usr/bin/kubelet"
}

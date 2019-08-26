# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.15.3
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
		sha256sums+=('f041c7e1bad2e335b958ee1968e0f807e97b3995afab938f96d3286d548308c3')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('c0b1c4fba9cdc324b6a882cd9e0cc2e38951928697fb4b2d62e05d687c53112a')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('dc08c9ad350d0046bc2ec910dcd266bd30cb6e7ef1f9170bb8df455d9d083d73')
		;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubelet")

package() {
  install -D -m0644 "kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "kubelet" "${pkgdir}/usr/bin/kubelet"
}

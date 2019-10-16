# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.16.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubeadm')
source=(
  "https://raw.githubusercontent.com/kubernetes/kubernetes/release-${pkgver%.*}/build/debs/10-kubeadm.conf"
)
sha256sums=('3b6e4cb3ac34a6df6dd60ce45c9ebf035fc3ec160dc001b28afb7cca1c11ef06')

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('cbddf79fbcdcde7046251b51ef52a16b08ed00bd9132f25cda5be9c82fa731fd')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('4287d025a0c9743325c8891b7139ff718c79e4302e2004c5472a06b410a196b1')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('9cd4a5b087088a9053ff40113ca182f0c2f959e2e51049ed2f850785c2588e04')
		;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "kubeadm" "${pkgdir}/usr/bin/kubeadm"
}

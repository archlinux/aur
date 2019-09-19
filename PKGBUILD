# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.16.0
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
		sha256sums+=('6c666958e11b7d4513adecb3107c885c98bdc79f38d369c9f80eaaeae4ddfe66')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('9a1d21bfb6bd15697ac010665e5917a5364b340d5b60f2f0302c179d75da0f3f')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('18f30d65fb05148c73cc07c77a83f4a2427379af493ca9f60eda42239409e7ef')
		;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "kubeadm" "${pkgdir}/usr/bin/kubeadm"
}

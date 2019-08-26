# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.15.3
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
		sha256sums+=('6c6fa56810908b5be83882094ea199844edc94b7e969160623c86512d9251c06')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('6f472bc8ab1ba3d76448bd45b200edef96741e5affde8dc1429300af3a4904d8')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('ec56a00bc8d9ec4ac2b081a3b2127d8593daf3b2c86560cf9e6cba5ada2d5a80')
		;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "kubeadm" "${pkgdir}/usr/bin/kubeadm"
}

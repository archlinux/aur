# Maintainer: Paul Nicholson <brenix@gmail.com>
# Contributor: Wes Jackson <icebal dot 7 at gmail dot com>

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.16.1
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
		sha256sums+=('38293a03064f47c3817299475b8dc950563854aff99a87d07cf31f0ebf402015')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('000aaffa911d3d46dad0a4af8d59408ee56eea5b8eff5cb1b9fbee9986763165')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('52ee74a9376b5b7d5296d9dab9bc54614b1c99d168003a78bdaea50f358a6886')
		;;
esac

source+=("https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubeadm")

package() {
  install -D -m0644 "10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "kubeadm" "${pkgdir}/usr/bin/kubeadm"
}

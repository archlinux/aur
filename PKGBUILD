# Maintainer: ProFfeSsoRr <evvsoft@gmail.com>
# Contributor: Joe Khoobyar <fourheads@gmail.com>

pkgname=crictl-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="CLI tool for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64 armv7l armv7h aarch64)
url="https://github.com/kubernetes-incubator/cri-tools/blob/master/docs/crictl.md"
license=('Apache')
provides=('crictl')
conflicts=('crictl')
source=("crictl.yaml")
sha256sums=('d2725490e1fb2e6f565605f09871c1440371b85e04de5d70bbac05954d827f72')

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('d420925d10b47a234b7e51e9cf1039c3c09f2703945a99435549fcdd7487ae3a')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('95ba32c47ad690b1e3e24f60255273dd7d176e62b1a0b482e5b44a7c31639979')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('876dd2b3d0d1c2590371f940fb1bf1fbd5f15aebfbe456703ee465d959700f4a')
		;;
esac
source+=("https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-${_pkgarch}.tar.gz")

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}

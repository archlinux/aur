# Maintainer: ProFfeSsoRr <evvsoft@gmail.com>
# Contributor: Joe Khoobyar <fourheads@gmail.com>

pkgname=crictl-bin
pkgver=1.17.0
pkgrel=2
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
		sha256sums+=('9700957218e8e7bdc02cbc8fda4c189f5b6223a93ba89d876bdfd77b6117e9b7')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('d89afd89c2852509fafeaff6534d456272360fcee732a8d0cb89476377387e12')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('7b72073797f638f099ed19550d52e9b9067672523fc51b746e65d7aa0bafa414')
		;;
esac
source+=("https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-${_pkgarch}.tar.gz")

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}

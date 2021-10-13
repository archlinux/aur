# Maintainer: ProFfeSsoRr <evvsoft@gmail.com>
# Contributor: Joe Khoobyar <fourheads@gmail.com>

pkgname=crictl-bin
pkgver=1.22.0
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
		sha256sums+=('b74f7cc52ce79c6d7fd776beb6353f4628e9c36f17ba2b8e6c48155714057f07')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('a713c37fade0d96a989bc15ebe906e08ef5c8fe5e107c2161b0665e9963b770e')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('45e0556c42616af60ebe93bf4691056338b3ea0001c0201a6a8ff8b1dbc0652a')
		;;
esac
source+=("https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-${_pkgarch}.tar.gz")

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}

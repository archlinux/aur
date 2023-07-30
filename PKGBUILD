# Maintainer: ProFfeSsoRr <evvsoft@gmail.com>
# Contributor: Joe Khoobyar <fourheads@gmail.com>

pkgname=crictl-bin
pkgver=1.27.1
pkgrel=1
pkgdesc="CLI tool for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64 armv7l armv7h aarch64)
url="https://github.com/kubernetes-incubator/cri-tools/blob/master/docs/crictl.md"
license=('Apache')
provides=('crictl')
conflicts=('crictl')
source=("crictl.yaml")
sha256sums=('d2725490e1fb2e6f565605f09871c1440371b85e04de5d70bbac05954d827f72'
            'b70e8d7bde8ec6ab77c737b6c69be8cb518ce446365734c6db95f15c74a93ce8')

case "$CARCH" in
	arm*) _pkgarch="arm"
		;;
	aarch64) _pkgarch="arm64"
		;;
	x86_64) _pkgarch="amd64"
		;;
esac
source+=("https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-${_pkgarch}.tar.gz")

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}

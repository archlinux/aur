# Maintainer: ProFfeSsoRr <evvsoft@gmail.com>
# Contributor: Joe Khoobyar <fourheads@gmail.com>

pkgname=crictl-bin
pkgver=1.20.0
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
		sha256sums+=('ed5ffdd386261ec1146731421d4ac9c5c7f91e08486fee409452a3364bef792a')
		;;
	aarch64) _pkgarch="arm64"
		sha256sums+=('eda6879710eb046d335162d4afe8494c6f8161142ad3188022852f64b92806a8')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('44d5f550ef3f41f9b53155906e0229ffdbee4b19452b4df540265e29572b899c')
		;;
esac
source+=("https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-${_pkgarch}.tar.gz")

package() {
  cd "$srcdir"
  install -Dm755 crictl "$pkgdir"/usr/bin/crictl
  install -Dm644 crictl.yaml "$pkgdir"/etc/crictl.yaml
}

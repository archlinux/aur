# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=crictl
pkgver=1.11.1
pkgrel=1
pkgdesc="CLI tool for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64)
url="https://github.com/kubernetes-incubator/cri-tools/blob/master/docs/crictl.md"
license=('Apache')
source=("git+https://github.com/kubernetes-incubator/cri-tools#tag=v${pkgver}"
        "crictl.yaml")
sha256sums=('SKIP'
            'd2725490e1fb2e6f565605f09871c1440371b85e04de5d70bbac05954d827f72')

prepare() {
  rm -rf src
  mkdir -p src/github.com/kubernetes-incubator
  mv -T cri-tools src/github.com/kubernetes-incubator/cri-tools
}

build() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/github.com/kubernetes-incubator/cri-tools"
  make crictl
}

package() {
  cd "$srcdir"
  install -Dm755 bin/crictl "$pkgdir/usr/bin/crictl"
  install -Dm644 crictl.yaml "$pkgdir/etc/crictl.yaml"
}


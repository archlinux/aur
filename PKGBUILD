# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=crictl
pkgver=1.11.1
pkgrel=1
pkgdesc="CLI tool for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64)
url="https://github.com/kubernetes-incubator/cri-tools/blob/master/docs/crictl.md"
license=('Apache')
source=("cri-tools-${pkgver}.tar.gz::https://github.com/kubernetes-incubator/cri-tools/archive/v${pkgver}.tar.gz"
        "crictl.yaml")
sha256sums=('a357c67c891896032865f7a34f7ec330e5a00fe7f20b6d8be50399b91c99a4ac'
            'd2725490e1fb2e6f565605f09871c1440371b85e04de5d70bbac05954d827f72')

build() {
  cd cri-tools
  make crictl
}

package() {
  cd cri-tools
  install -Dm755 _output/bin/crictl "$pkgdir/usr/bin/crictl"
  install -Dm644 "$srcdir/crictl.yaml" "$pkgdir/etc/crictl.yaml"

  "$pkgdir/usr/bin/crictl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/crictl"
  "$pkgdir/usr/bin/crictl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_crictl"
}


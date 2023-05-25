# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.14.4
pkgrel=1
pkgdesc='Network, Service & Security Observability for Kubernetes using eBPF'
arch=('x86_64' 'aarch64')
url='https://cilium.io/'
license=('Apache')
makedepends=()
provides=("cilium-cli=${pkgver}")
conflicts=('cilium-cli')

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cilium/cilium-cli/releases/download/v${pkgver}/cilium-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/cilium/cilium-cli/releases/download/v${pkgver}/cilium-linux-arm64.tar.gz")
sha256sums_x86_64=('6b3950f8c3b1e8cf7e2123bb4cb1fae4217d720b3353bf924c78d87824c9f1b0')
sha256sums_aarch64=('6b6326c178df30085da0f584ac380b1c81bdfbbb7c2a8df0862184444b8bd9eb')

options=("!strip")
bin=cilium

package() {
  "$srcdir/$bin" completion zsh > "$srcdir/zsh-$bin"
  install -D -g root -m 0644 "$srcdir/zsh-$bin" "$pkgdir/usr/share/zsh/site-functions/_$bin"

  "$srcdir/$bin" completion bash > "$srcdir/bash-$bin"
  install -D -g root -m 0644 "$srcdir/bash-$bin" "$pkgdir/usr/share/bash-completion/completions/$bin"

  install -D -g root -m 0755 -o root "$srcdir/$bin" "$pkgdir/usr/bin/$bin"
}

# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.13.0
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
sha256sums_x86_64=('60d0aedaa41e99e0ce361a115ab428007c1096ab4a45d391b56ce906840b7689')
sha256sums_aarch64=('efee9ce978e53c68d00c9c9cc0c5debf6eb9e910fff86edadd318dd61de4388b')

options=("!strip")
bin=cilium

package() {
  "$srcdir/$bin" completion zsh > "$srcdir/zsh-$bin"
  install -D -g root -m 0644 "$srcdir/zsh-$bin" "$pkgdir/usr/share/zsh/site-functions/_$bin"

  "$srcdir/$bin" completion bash > "$srcdir/bash-$bin"
  install -D -g root -m 0644 "$srcdir/bash-$bin" "$pkgdir/usr/share/bash-completion/completions/$bin"

  install -D -g root -m 0755 -o root "$srcdir/$bin" "$pkgdir/usr/bin/$bin"
}

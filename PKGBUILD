# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.14.3
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
sha256sums_x86_64=('613ffc1cc62ce35b519feb6fc39d1cb2b46635511d365db0da5df498fc6bc001')
sha256sums_aarch64=('36df943449dde3eecf1e45cc42a244ef5163ac89f614791a0657cf03ff92273f')

options=("!strip")
bin=cilium

package() {
  "$srcdir/$bin" completion zsh > "$srcdir/zsh-$bin"
  install -D -g root -m 0644 "$srcdir/zsh-$bin" "$pkgdir/usr/share/zsh/site-functions/_$bin"

  "$srcdir/$bin" completion bash > "$srcdir/bash-$bin"
  install -D -g root -m 0644 "$srcdir/bash-$bin" "$pkgdir/usr/share/bash-completion/completions/$bin"

  install -D -g root -m 0755 -o root "$srcdir/$bin" "$pkgdir/usr/bin/$bin"
}

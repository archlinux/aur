# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.14.2
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
sha256sums_x86_64=('7ff65f0e85af5daa755c63851f85dea656a59ae4a306e1e9ae02abdf0014f564')
sha256sums_aarch64=('bf94d6aaaf02a6bf728e4ea022e7e37b2dfdc49d5931245be298b2ff4d6af008')

options=("!strip")
bin=cilium

package() {
  "$srcdir/$bin" completion zsh > "$srcdir/zsh-$bin"
  install -D -g root -m 0644 "$srcdir/zsh-$bin" "$pkgdir/usr/share/zsh/site-functions/_$bin"

  "$srcdir/$bin" completion bash > "$srcdir/bash-$bin"
  install -D -g root -m 0644 "$srcdir/bash-$bin" "$pkgdir/usr/share/bash-completion/completions/$bin"

  install -D -g root -m 0755 -o root "$srcdir/$bin" "$pkgdir/usr/bin/$bin"
}

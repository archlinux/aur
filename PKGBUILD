# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.13.2
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
sha256sums_x86_64=('4025a291864b1fd0087486b0b9ad232a210e4c19cb0324a8d6a76ef842e40fca')
sha256sums_aarch64=('d0ae083ebc6e5f5416637cec0d31e2b3d9191513e3a6d61f3d1519b4e7797abf')

options=("!strip")
bin=cilium

package() {
  "$srcdir/$bin" completion zsh > "$srcdir/zsh-$bin"
  install -D -g root -m 0644 "$srcdir/zsh-$bin" "$pkgdir/usr/share/zsh/site-functions/_$bin"

  "$srcdir/$bin" completion bash > "$srcdir/bash-$bin"
  install -D -g root -m 0644 "$srcdir/bash-$bin" "$pkgdir/usr/share/bash-completion/completions/$bin"

  install -D -g root -m 0755 -o root "$srcdir/$bin" "$pkgdir/usr/bin/$bin"
}

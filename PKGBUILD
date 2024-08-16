# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
# Maintainer: Lukas Grossar <lukas[dot]grossar[at]gmail[dot]com>

pkgname=kind-bin
pkgdesc="Kubernetes IN Docker - local clusters for testing Kubernetes"
pkgver=0.24.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kind"
license=('Apache')
provides=('kind')
conflicts=('kind')
_binary=kind-linux-amd64
source=("$_binary-$pkgver::https://github.com/kubernetes-sigs/kind/releases/download/v$pkgver/$_binary")
sha256sums=('b89aada5a39d620da3fcd16435b7f28d858927dd53f92cbac77686b0588b600d')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/kind"

  "$pkgdir/usr/bin/kind" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kind"
  "$pkgdir/usr/bin/kind" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kind"
  "$pkgdir/usr/bin/kind" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/kind.fish"
}

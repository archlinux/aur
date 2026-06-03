# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
# Maintainer: Lukas Grossar <lukas[dot]grossar[at]gmail[dot]com>

pkgname=kind-bin
pkgdesc="Kubernetes IN Docker - local clusters for testing Kubernetes"
pkgver=0.32.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kind"
license=('Apache-2.0')
provides=('kind')
conflicts=('kind')
_binary=kind-linux-amd64
source=("$_binary-$pkgver::https://github.com/kubernetes-sigs/kind/releases/download/v$pkgver/$_binary")
sha256sums=('50030de23cf40a18505f20426f6a8506bedf13c6e509244bd1fa9463721b0f54')

package() {
  install -Dm 755 "$srcdir/$_binary-$pkgver" "$pkgdir/usr/bin/kind"

  "$pkgdir/usr/bin/kind" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kind"
  "$pkgdir/usr/bin/kind" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kind"
  "$pkgdir/usr/bin/kind" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/kind.fish"
}

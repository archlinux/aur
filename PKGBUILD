# Maintainer: Máté Eckl <ecklm94@gmail.com>

_pkgname=kubectl-argo-rollouts
pkgname=$_pkgname-bin
pkgver=1.8.3
pkgrel=2
pkgdesc="Kubectl plugin for argo rollouts"
arch=(x86_64)
depends=(kubectl)
url="https://github.com/argoproj/argo-rollouts"
license=(Apache-2.0)
_upstream_filename=$_pkgname-linux-amd64
_versioned_filename=$_upstream_filename-$pkgver
source=($_versioned_filename::https://github.com/argoproj/argo-rollouts/releases/download/v$pkgver/$_upstream_filename)
sha512sums=('e363639c68c86ea68b9f9f5afe6b51f2d4515f1309ce06b4a75a026a1c1648a2219add11d4ab3c5cc2e81693e3422aa27a84e2f1cc4ab40adfa5c581a00730cf')
b2sums=('ecad8759b86f81c260ef2bccaa19e5bc3ccefbacda1cf4a5043f400b74cad14ee39fa6ba1243b6d881cddc583f47b0297bc37489acb960d7ac51d1c3f737f71a')

build() {
  mv -v $_versioned_filename $_pkgname
  chmod +x $_pkgname

  # shell completion
  mkdir -vp completions
  ./$_pkgname completion bash > completions/$_pkgname
  ./$_pkgname completion zsh > completions/_$_pkgname
  ./$_pkgname completion fish > completions/$_pkgname.fish
}

package() {
  install -vDm 755 $_pkgname -t "$pkgdir/usr/bin"
  # shell completion
  install -vDm 644 completions/$_pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
  install -vDm 644 completions/_$_pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 completions/$_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}

# Maintainer: Máté Eckl <ecklm94@gmail.com>

_pkgname=kubectl-argo-rollouts
_pkgname_upstream_suffix=-linux-amd64
pkgname=$_pkgname-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Kubectl plugin for argo rollouts"
arch=(x86_64)
depends=(kubectl)
url="https://github.com/argoproj/argo-rollouts"
license=(Apache-2.0)
source=($_pkgname::https://github.com/argoproj/argo-rollouts/releases/download/v$pkgver/$_pkgname$_pkgname_upstream_suffix)
sha512sums=('5002a9cc40d3e0f268f4f2537d43352536f2c6b0d16cd04f2414846861f64a9a82e4dea1d247896994199c58f2dffd6ba53890b1f44026245da5b8ad108bd333')
b2sums=('6c6721154b2bb1eefb5c7390b3a2951097ec34823cbed0ace7534e1beae289285040cc507d64ee10bac07aeefffdd2ffb951942fd7dbd770f4a7c7c7bbd2eebf')

build() {
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

# Maintainer: Máté Eckl <ecklm94@gmail.com>

_pkgname=argo
_pkgname_upstream_suffix=-linux-amd64
pkgname=$_pkgname-cli-bin
pkgver=3.7.1
pkgrel=2
pkgdesc="Kubectl plugin for argo rollouts"
arch=(x86_64)
depends=()
url="https://github.com/argoproj/argo-rollouts"
license=(Apache-2.0)
_bin_name=$_pkgname$_pkgname_upstream_suffix
_filename=$_bin_name.gz
source=(https://github.com/argoproj/argo-workflows/releases/download/v$pkgver/$_filename)
sha512sums=('95c221e8a2bdb97cc03287c79bb9612980771f9f3621c5168eec90722120f0177bf32b06bc6824edd9fb8fe6bf0be9d613e77eff4a8dff47230c79b91a1aa9ab')
b2sums=('12f6824abd778f90c8e8cd50491a81e84b473a3cfe6821d491d6f8f73570816395d2cbf211608a8b435b2414d7478e5fa3f5ee022c579e3f14b1d5a258492f1c')

build() {
  chmod +x $_bin_name
  mv $_bin_name $_pkgname

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

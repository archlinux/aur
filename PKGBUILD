# Maintainer: Máté Eckl <ecklm94@gmail.com>

_pkgname=kubectl-argo-rollouts
_pkgname_upstream_suffix=-linux-amd64
pkgname=$_pkgname-bin
pkgver=1.7.2
pkgrel=2
pkgdesc="Kubectl plugin for argo rollouts"
arch=(x86_64)
depends=(kubectl)
url="https://github.com/argoproj/argo-rollouts"
license=(Apache-2.0)
source=($_pkgname::https://github.com/argoproj/argo-rollouts/releases/download/v$pkgver/$_pkgname$_pkgname_upstream_suffix)
sha512sums=('f0411cced83f37aed0c6fbfc51e6b453091fc810f8364f65957571940bfc198c3553469fa74cd19103764fafe6e9ae0ac402fed864fad04d9e612231cf1012b7')
b2sums=('228513ab803859e89e484f405a9f24710b0ca5c512c7b95e7d384253979332997f78f7920647bd7e1581afc8e001699239e4a72819635b2be1f19f2f6251181b')

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

# Maintainer: Máté Eckl <ecklm94@gmail.com>

_pkgname=kubectl-argo-rollouts
_pkgname_upstream_suffix=-linux-amd64
pkgname=$_pkgname-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Kubectl plugin for argo rollouts"
arch=(x86_64)
depends=(kubectl)
url="https://github.com/argoproj/argo-rollouts"
license=(Apache-2.0)
source=($_pkgname::https://github.com/argoproj/argo-rollouts/releases/download/v$pkgver/$_pkgname$_pkgname_upstream_suffix)
sha512sums=('883cba132ab3edf9a26f82e15e67ffbdb7540a32f46fb3e5489f1b5215c977a0bef8fc488a4747deac8405e4fdfa81d6d0590352d19b608b2fdd2150174dbb1b')
b2sums=('3b77e258146f220178b1e85b192b426fae492f5eae45065b7df05b3d8639e680743ae751c0b936e56c6b902218188ef2dfa3a7ad260d17dbefb5f41b0d9c1c46')

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

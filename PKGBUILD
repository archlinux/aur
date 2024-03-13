# Maintainer: Máté Eckl <ecklm94@gmail.com>

_pkgname=kubectl-argo-rollouts
_pkgname_upstream_suffix=-linux-amd64
pkgname=$_pkgname-bin
pkgver=1.6.6
pkgrel=1
pkgdesc="Kubectl plugin for argo rollouts"
arch=(x86_64)
depends=(kubectl)
url="https://github.com/argoproj/argo-rollouts"
license=(Apache-2.0)
source=($_pkgname::https://github.com/argoproj/argo-rollouts/releases/download/v$pkgver/$_pkgname$_pkgname_upstream_suffix)
sha512sums=('a9ac58b1202577edd98c7d7676d70df6e61e99f533d09f71b6195684cd75e0b8d8689aed3f6248dab9ebb43adc88413fc5155d606b027f8d8ee6b6a66e04ffc0')
b2sums=('e4f158ae34e6cf90b9d173343d88a387538b4faa99cc7cdfbdc2228559d750094149cdecc6c6b24f7fe7718edd96d6ec60792d048a77c0abd22a7afa912cc356')

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

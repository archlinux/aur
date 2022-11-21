# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: gun1x <gheorghe@linux.com>


pkgname=kubectl-bin
pkgdesc="Kubernetes.io kubectl binary"
pkgver=1.25.4
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=()
conflicts=('kubectl')
provides=('kubectl')
source=()
b2sums=()

case "$CARCH" in
  x86_64) _pkgarch="amd64"
    b2sums+=('2f67194bb2890c5c5ce0b29637a5c539524daebb7f6723aacee828de25e9a08aa8f744f302215b16cf70d4bb69eac8cc4ae03533d3f7f806f57b6539b0fc6193')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('076a1fe1915208ff8b08f3697398f3688921e706f188805010ae08e630a26766ad390c6c49e47c54a2d1daae206e0694c0fda0ba5e5eb6fa3f9870a9385f37fb')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('e3eb2f1cf6fc1ff287d2c45384c36a52bd51e6ae12ab5c5b47e1b6c6eacf07a15f076e187e7febc12833a94a546bc4a90a90747d292023082e432ccfa007fa7d')
    ;;
esac

source+=(${pkgname}-${pkgver}-${_pkgarch}::"https://storage.googleapis.com/kubernetes-release/release/v${pkgver}/bin/linux/${_pkgarch}/kubectl")

package() {
  # Kubectl Binary
  install -D -m 0755 "${pkgname}-${pkgver}-${_pkgarch}" "${pkgdir}/usr/bin/kubectl"
  # Shell Completions
  mkdir -p completions
  ${pkgdir}/usr/bin/kubectl completion bash > completions/kubectl
  ${pkgdir}/usr/bin/kubectl completion zsh  > completions/_kubectl
  ${pkgdir}/usr/bin/kubectl completion fish > completions/kubectl.fish
  install -D -m 0644 completions/kubectl ${pkgdir}/usr/share/bash-completion/completions/kubectl
  install -D -m 0644 completions/_kubectl ${pkgdir}/usr/share/zsh/site-functions/_kubectl
  install -D -m 0644 completions/kubectl.fish ${pkgdir}/usr/share/fish/vendor_completions.d/kubectl.fish
}

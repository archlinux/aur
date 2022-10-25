# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: gun1x <gheorghe@linux.com>


pkgname=kubectl-bin
pkgdesc="Kubernetes.io kubectl binary"
pkgver=1.25.3
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
    b2sums+=('a4c381dabad907fcb9960c40a16c1c3730c8c2822ba2e402ddd20a59ee99d0b821995ed36bc8c093d14cf4426812f06fe4f4417fcb726e22badb28b99b5e5d4e')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('bd5b1f76086c64273274fbf6fde77b4fbede05535a4e2efc8c8cc2ddb1941508b8f47d24ca69c74f5cf6901468f3466dc402ce80035bc9376ddc049e238fa4b9')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('b9fee7c41a0de1317678f10d65db9c70d6ef01c77a9a0aa6db991f6e28762fd3385abe49fe5ec70cde4189e124cbf10416d568da5fdf34f5795bdba90c2b9430')
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

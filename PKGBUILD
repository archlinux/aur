# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: gun1x <gheorghe@linux.com>


pkgname=kubectl-bin
pkgdesc="Kubernetes.io kubectl binary"
pkgver=1.26.3
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
    b2sums+=('3de452796544e41df72c5233b447735c8c35bbda19a429fdbe6da132d67d93d282a2792ac5c700ef96acc98f53344fea3976805bd51f1997516daac529018a8c')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('83894d13ef171b1fe0327790d1ecc293dd5686dd8df9919ecf0f6aaffa101a9d57c97abc4a90e580da6ade0011ab3524d675fa13e5cfc0145ef1b48401489ef6')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('324c127a995c5a7149f3b3932123433a4800313259d92cfdd9271f16f4673ea0892451ccaf2ef152c3aab193b9abc08fb45cf9794fbf1c72daa42c732954375a')
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

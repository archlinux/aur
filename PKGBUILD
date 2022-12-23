# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: gun1x <gheorghe@linux.com>


pkgname=kubectl-bin
pkgdesc="Kubernetes.io kubectl binary"
pkgver=1.26.0
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
    b2sums+=('303573fda6a7cfd9901420bbe6e477b540a1dc8c66063e873d02ea60aefeda5e04fdb099658320391036f037dfac71e8e3cebbee255900a6995f9edd98ce6cc1')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('7d780a331effe3acb32a0938fff79cbbc9ee32f47f32b43aef640653a9084eab72641ffde56349c0a624abc2d087b253d6c3df5a78d5c3325a6cb907a1fa28a7')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('2814020216eb29219836e65b755cf64a872de1085cebce4123253e094ab2e23fb93dc1f02ac95af884c96d01c649ff8d7623a8360d7073340eabe300c2a87b09')
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

# Maintainer: George Raven <GeorgeRavenCommunity PLUS kubeadmbin AT pm DOT me>
# Contributor: larte <lauri.arte@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: gun1x <gheorghe@linux.com>


pkgname=kubectl-bin
pkgdesc="Kubernetes.io kubectl binary"
pkgver=1.26.2
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
    b2sums+=('73cdf25f96c48adbb9b14229dbd4176f815517ff7d96f6f71e05d4e53c2f64c8456e07222294191a5f7d9a11a4fa9203a51550ebc051fa4f7d30176a96e45aa7')
    ;;
  arm*) _pkgarch="arm"
    b2sums+=('71f5b246b0d530bbd40ed6b3208f747e4d6b39b513571e7b68a8ca60cab60ce3d507b9c833e3f2f4f496720b81b1753774e6f6b4a90f66551db313f6fbf3f729')
    ;;
  aarch64) _pkgarch="arm64"
    b2sums+=('dbb3da64ba18b28c6195e5f0ce068cd88743a8a1c1149196e781c465e615a917329b512eb3459d76fff6c6b1e4a6bcd84a81d3850405a821621554bef7027d19')
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

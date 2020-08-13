# Maintainer: zer0def <zer0def@github>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Wayne Cheng <waynethecheng@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=helm2-bin
pkgver=2.16.10
pkgrel=1
pkgdesc="The Kubernetes Package Manager"
arch=(
  "x86_64"  # amd64
  "aarch64"  # arm64
  "arm" "armv6h" "armv7h"  # arm
  "i486" "i686"  # i386
)
url="https://helm.sh/"
license=("Apache")
provides=("helm2" "kubernetes-helm2" "helm" "kubernetes-helm")
conflicts=("helm2" "kubernetes-helm2")
makedepends=("grep")
install=helm2-bin.install
validpgpkeys=(  # https://raw.githubusercontent.com/helm/helm/master/KEYS
  672C657BE06B4B30969C4A57461449C25E36B98E  # Matthew Farina <matt@mattfarina.com>, https://keybase.io/mattfarina
  F1261BDE929012C8FF2E501D6EA5D7598529A53E  # Martin Hickey <martin.hickey@ie.ibm.com>
  967F8AC5E2216F9F4FD270AD92AA783CBAAE8E3B  # Matthew Fisher <matt.fisher@microsoft.com>
  76939899B137D575D3274E756DCCB9D752D35BA8  # Taylor Thomas <taylor.thomas@microsoft.com>
  49D09C86C3DC8DA3F0A076221EF612347F8A9958  # Adam Reese <adam@reese.io>
  ABA2529598F6626C420D335B62F49E747D911B60  # Matt "technosophos" Butcher <matt.butcher@microsoft.com>, https://keybase.io/technosophos
)

sha256sums=('SKIP')

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums+=('65a4857611a4e65b255ec192cbdb34d47212f041260f81a1039c05a8bb9ea041');;
  aarch64)   _CARCH=arm64 && sha256sums+=('9ed3b0aefbe856d720b48c74dcd9c30c8dde0d1df385d62c1fb191b36f9cfb92');;
  arm*)      _CARCH=arm   && sha256sums+=('c891d66cfc09dbf32e3ea83879c8afe8b3f2462d62d6970a9a229424180eebd7');;
  i486|i686) _CARCH=386   && sha256sums+=('9d6299ce1ce8b91bc09c6fbd9634a40fe8332a37f3d94b42c225e9b78e33ed3f');;
esac

source=(
  "https://github.com/helm/helm/releases/download/v${pkgver}/helm-v${pkgver}-linux-${_CARCH}.tar.gz.asc"
  "https://get.helm.sh/helm-v${pkgver}-linux-${_CARCH}.tar.gz"
)

package(){
    cd "${srcdir}/linux-${_CARCH}"
    install -Dm755 helm "${pkgdir}/usr/bin/helm2"
    install -Dm755 tiller "${pkgdir}/usr/bin/tiller"
    ./helm completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/helm2"
    ./helm completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_helm2"
}

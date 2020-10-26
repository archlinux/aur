# Maintainer: zer0def <zer0def@github>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Wayne Cheng <waynethecheng@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=helm2-bin
pkgver=2.17.0
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
b2sums=('SKIP')

case "${CARCH}" in
  x86_64)
    _CARCH=amd64
    sha256sums+=('f3bec3c7c55f6a9eb9e6586b8c503f370af92fe987fcbf741f37707606d70296')
    b2sums+=('4b53c62a3202cbb327ad357427bb1439e8a497d0018dea255299c9ba12a40d51970308736818a4c9f5393e379e0f7a214086eb8621a27ea259268da0bf2d0476')
  ;;
  aarch64)
    _CARCH=arm64
    sha256sums+=('c3ebe8fa04b4e235eb7a9ab030a98d3002f93ecb842f0a8741f98383a9493d7f')
    b2sums+=('6a21e26193de5eee6409b1084ea63e290468d964a2d4e66c9f805ec70264c51658feb1a8191223465f46e706b95c37d507dcfca536825d3de6246101169d7534')
  ;;
  arm*)
    _CARCH=arm
    sha256sums+=('bf972150ba0b950119a3fe7ac9ed19d467c703fa552ba4ac79a0ad7f1f9e70c4')
    b2sums+=('652fa732cf888d94bddc927017305f5cc3e2e90102ca11ad08e99ff07f2d9415dd4ad2300e6232dc61a0435531070637e90950e874c01d2a8dc539dee2d0bbbf')
  ;;
  i486|i686)
    _CARCH=386
    sha256sums+=('843a0b92441a932be005f4c692f920b24014403c294856a396509c42c90f78aa')
    b2sums+=('44152f99a9790124e095a22cfd5aedec01a7cafd2cf5c5ed178645b8346a9346f5872c6f80077fd3876247cf1cb4169fa013240ada5ee864b9cb8a38e7608c1f')
  ;;
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

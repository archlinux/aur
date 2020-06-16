# Maintainer: zer0def <zer0def@github>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Wayne Cheng <waynethecheng@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=helm2-bin
pkgver=2.16.9
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
  x86_64)    _CARCH=amd64 && sha256sums+=('197b9338129000f5d085b37e93ae3bcdd785901356a426dfa1f948d6b7a5a744');;
  aarch64)   _CARCH=arm64 && sha256sums+=('81e2c7472f4a1e3ce3722a6793ea6de8e6c30016419a5cfea588acd33e43b31d');;
  arm*)      _CARCH=arm   && sha256sums+=('ddb62df4b6fb8ebac4d4eb25da9bf9530eaea07545a1d4f3867d1714832d55d1');;
  i486|i686) _CARCH=386   && sha256sums+=('08c4d13be1e2d4ca05ae4bda52e4475e22fa66c413f39d7615219ece676d40cd');;
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

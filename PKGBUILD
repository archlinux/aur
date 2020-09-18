# Maintainer: zer0def <zer0def@github>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Wayne Cheng <waynethecheng@gmail.com>
# Contributor: Matthias Lisin <ml@visu.li>

pkgname=helm2-bin
pkgver=2.16.12
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
    sha256sums+=('756ab375314329b66b452c0f9d569f74b0760141670217c07b79890ad314c214')
    b2sums+=('3238d0cde382c36700e1bcee72f133eaf0fb7fb65ad8077dce115322cd9c331c3c352e467da79184cf70f0b99e76f4e239aac3dfa0403abaf6c98a929eef990b')
  ;;
  aarch64)
    _CARCH=arm64
    sha256sums+=('89401ff12095de05f8c79ff86f4d27b8c5caf98db02f26a996ad58bd85f20404')
    b2sums+=('bff42bdddc99e24d884ff9b612419ebb811c968ff2e6c8d0e141ad327b61872baca077013f58c8a25c3205ed5dd7bf74382ef1f616a96848636f38962b5cb92f')
  ;;
  arm*)
    _CARCH=arm
    sha256sums+=('fe82228965d6ad8454601d5bf43b7f5d395c5325c9866b0e4362ae07e957ceb9')
    b2sums+=('f974fad8a309256949a5c8057d9c009f0c6fec09e282764386b802d4a5bd51678d75f24d6802368a3bdf637d0d65d4461423b7df76fa30c3ae137ad71f71ff08')
  ;;
  i486|i686)
    _CARCH=386
    sha256sums+=('03ec72b5a09b1d1daacb5d48cb4e9d56f9ca2a5061195e7d9cd6c68b09a4a1bf')
    b2sums+=('8906de88773d7dbb55436d795b4f2f42748a8f65ffe3437aef48138821d9f86c915ba4a50fa48465d3ea5c014f70e17c63df3404b9f6f2c24f7f9fa61db4295b')
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

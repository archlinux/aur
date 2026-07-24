# Maintainer: Crumble <crumble@crumble.sh>

pkgname=hemtt-bin
_pkgname=hemtt
pkgver=1.20.1
pkgrel=0
pkgdesc="powerful, opinionated and modern build system for Arma 3 mod development"
url="https://github.com/brettmayson/HEMTT"
arch=('x86_64')
license=('GPL2')
provides=("hemtt=${pkgver}")
conflicts=('hemtt' 'hemtt-git')
source=("${_pkgname}-${pkgver}::https://github.com/brettmayson/HEMTT/releases/download/v${pkgver}/linux-x64")
sha256sums=('4ec152f9174be9745c8ee571df0862246b1beb9819c92d3f8876f1c406faf3ea')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/hemtt"

  # Shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  "${pkgdir}/usr/bin/hemtt" manage completions bash \
    > "${pkgdir}/usr/share/bash-completion/completions/hemtt"

  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/hemtt" manage completions zsh \
    > "${pkgdir}/usr/share/zsh/site-functions/_hemtt"

  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${pkgdir}/usr/bin/hemtt" manage completions fish \
    > "${pkgdir}/usr/share/fish/vendor_completions.d/hemtt.fish"
}
# Maintainer: Crumble <crumble@crumble.sh>

pkgname=hemtt-bin
_pkgname=hemtt
pkgver=1.20.0
pkgrel=0
pkgdesc="powerful, opinionated and modern build system for Arma 3 mod development"
url="https://github.com/brettmayson/HEMTT"
arch=('x86_64')
license=('GPL2')
provides=("hemtt=${pkgver}")
conflicts=('hemtt' 'hemtt-git')
source=("${_pkgname}-${pkgver}::https://github.com/brettmayson/HEMTT/releases/download/v${pkgver}/linux-x64")
sha256sums=('d6e53a82b6c0c6379a81ecf6350bbf044d6484bf72079b31694be69c1244953f')

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
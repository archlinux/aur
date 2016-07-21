# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor:  jyantis <yantis@yantis.net>

_pkgname=powerlevel9k
pkgname=zsh-theme-${_pkgname}
pkgver=0.4.0
pkgrel=3
pkgdesc='Powerlevel9k theme for zsh'
arch=('any')
url='https://github.com/bhilburn/powerlevel9k'
license=('custom')
depends=('zsh' 'powerline-fonts')
optdepends=('oh-my-zsh-git: oh-my-zsh integration'
  'prezto-git: Prezto integration'
  'antigen-git: Antigen integration'
  'zpm: ZPM integration'
  'zsh-zim-git: Zim integration'
  'awesome-terminal-fonts: icon package'
  'acpi: battery monitoring'
  'git: status of repository'
  'mercurial status of repository')
 
source=("https://github.com/bhilburn/powerlevel9k/archive/v${pkgver}.tar.gz")
sha512sums=('169727f6be8eaf9b04499f40738597ae6652bd5adf23b4110f9a169022e2171abab6e288a1293d28f72ebe3e63428b3c99458b8ebbd5b19d27dc87799f644a75')
provides=("zsh-theme-${_pkgname}")
conflicts=("zsh-theme-${_pkgname}")
install="zsh-theme-${_pkgname}.install"

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # No license
  # Install Readme as License in case in the future some type of license is
  # added
  install -D -m644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install the theme
  install -D -m644 powerlevel9k.zsh-theme "${pkgdir}/usr/share/zsh-theme-${_pkgname}/${_pkgname}.zsh-theme"

  # Install the utilities
  for FILE in functions/*.zsh; do
    install -D -m644 "${FILE}" "${pkgdir}/usr/share/zsh-theme-${_pkgname}/functions/$(basename ${FILE})"
  done
}

# vim:set et sw=2 ts=2 tw=79:

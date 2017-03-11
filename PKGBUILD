# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor:  jyantis <yantis@yantis.net>

_pkgname=powerlevel9k
pkgname=zsh-theme-"${_pkgname}"
pkgver=0.6.1
pkgrel=2
pkgdesc='Powerlevel9k theme for zsh'
arch=('any')
url='https://github.com/bhilburn/powerlevel9k'
license=('custom')
depends=('zsh')
optdepends=(
  'powerline-fonts: powerline fonts integration'
  'oh-my-zsh-git: oh-my-zsh integration'
  'prezto-git: Prezto integration'
  'antigen-git: Antigen integration'
  'zpm: ZPM integration'
  'zsh-zim-git: Zim integration'
  'awesome-terminal-fonts: icon package'
  'acpi: battery monitoring'
  'git: status of repository'
  'mercurial: status of repository'
  'systemd: virtualization detection'
  'openssh: ssh detection')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bhilburn/powerlevel9k/archive/v${pkgver}.tar.gz")
sha512sums=('9c51063542334452334aaf489903f25ad67793d41604c35bbd3dc21565e7689b3906ac90698a1339b33ac8512f7f52daa1875614d56cb5eac97875bdc2a0e4e1')

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

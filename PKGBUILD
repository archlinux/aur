# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor:  jyantis <yantis@yantis.net>

_pkgname=powerlevel9k
pkgname=zsh-theme-"${_pkgname}"
pkgver=0.6.2
pkgrel=1
pkgdesc='Powerlevel9k theme for zsh'
arch=('any')
url='https://github.com/bhilburn/powerlevel9k'
license=('mit')
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bhilburn/powerlevel9k/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/bhilburn/powerlevel9k/releases/download/v${pkgver}/powerlevel9k-${pkgver}.tar.gz.asc")
sha512sums=('ca8e8282ec5eb066a1ab7a368d7fab4099b8662f4eefc06ce088e36f46320b601c9349a32b0b29cc7156aa4ab80223e0e584669a5493493005d0f50ec54f13e8'
            'SKIP')
validpgpkeys=('C8D4D38F9ABB16BD3C6170F7ECD0D0410C149675')

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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

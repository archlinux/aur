# Maintainer: Ron Asimi <ron dot asimi at gmail dot com>

_pkgname=powerlevel10k
pkgname=zsh-theme-${_pkgname}-git
pkgver=v0.6.6.r172.gc3717ba
pkgrel=1
pkgdesc='Powerlevel10k theme for zsh'
arch=('any')
url='https://github.com/romkatv/powerlevel10k'
license=('MIT')
depends=('zsh')
optdepends=(
  'powerline-fonts: patched fonts for powerline'
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
source=("${_pkgname}::git+https://github.com/romkatv/${_pkgname}.git")
sha256sums=('SKIP')
makedepends=('git')
provides=("zsh-theme-${_pkgname}")
conflicts=(
  "zsh-theme-${_pkgname}"
  "zsh-theme-powerlevel9k-git"
)
install="zsh-theme-${_pkgname}.install"

pkgver()
{
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "${srcdir}/${_pkgname}"

  # Install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install the theme
  install -D -m644 powerlevel10k.zsh-theme "${pkgdir}/usr/share/zsh-theme-${_pkgname}/${_pkgname}.zsh-theme"

  # Install the utilities
    install -D -m644 "${pkgdir}/functions/"
    cp -r ${srcdir}/${pkgname}-${pkgver}/functions/* ${pkgdir}/functions/
    install -D -m644 "${pkgdir}/usr/share/zsh-theme-${_pkgname}/gitstatus/gitstatus.plugin.zsh"
    install -D -m644 "${pkgdir}/usr/share/zsh-theme-${_pkgname}/gitstatus/bin/gitstatusd-linux-x86_64"
}

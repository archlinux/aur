# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=zshmarks-git
pkgver=r58.91a88d9
pkgrel=1
pkgdesc='A simple command line bookmarking plugin, for zim, prezto or oh-my-zsh'
arch=('any')
url='https://github.com/jocelynmallon/zshmarks'
license=('unknown')
depends=('zsh')
optdepends=('zsh-zim-git: for use with zim'
            'prezto-git: for use with prezto'
            'oh-my-zsh-git: for use with oh-my-zsh')
makedepends=('git')
source=("git+https://github.com/jocelynmallon/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _installpath="/usr/lib"
  mkdir -p "${pkgdir}${_installpath}"
  cp -r ${pkgname%-git} "${pkgdir}${_installpath}"

  _pluginpaths=("/usr/lib/zim/modules"
                "/usr/lib/prezto/modules"
                "/usr/share/oh-my-zsh/plugins")
  for _pluginpath in ${_pluginpaths[@]}; do
    mkdir -p "${pkgdir}${_pluginpath}"
    ln -s "${_installpath}/${pkgname%-git}" "${pkgdir}${_pluginpath}/"
  done
}

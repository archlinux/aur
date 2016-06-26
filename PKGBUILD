# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Simon (vodik) Gomizelj <simongmzlj@gmail.com>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: jcsiv <siviter dot jamie at gmx dot co dot uk>
# Contributor: ThinCarrotShrimp <christoph.r.martin+arch at gmail dot com>

pkgname=oh-my-zsh-git
pkgver=r3993.7fabc8b
pkgrel=1
pkgdesc="A community-driven framework for managing your zsh configuration. Includes 180+ optional plugins and over 120 themes to spice up your morning, and an auto-update tool so that makes it easy to keep up with the latest updates from the community"
arch=('any')
url='https://github.com/robbyrussell/oh-my-zsh'
license=('MIT')
depends=('zsh')
makedepends=('git')
optdepends=('ruby: for some plugin functionality'
            'python: for some plugin functionality'
            'oh-my-zsh-powerline-theme-git: great theme'
            'bullet-train-oh-my-zsh-theme-git: better powerline theme'
            'git: most themes use git (highly recommended but still optional)')
install=${pkgname}.install
source=("${pkgname}::git+git://github.com/robbyrussell/oh-my-zsh.git"
        '0001-zshrc.patch')
md5sums=('SKIP'
         'd3efcbb22500b696442e2e83f81e699c')
# conflicts=('grml-zsh-config'
#            'grml-zsh-config-git')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cp "templates/zshrc.zsh-template" "zshrc"
  patch -p1 < "${srcdir}/0001-zshrc.patch"
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/oh-my-zsh"
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r * "${pkgdir}/usr/share/oh-my-zsh/"
}

# vim:set ts=2 sw=2 et:

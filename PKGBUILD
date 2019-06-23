# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: János Illés <ijanos@gmail.com>
_pkgname=vim-fugitive
pkgname="${_pkgname}-git"
pkgver=2.5.139.g6d42c7d
pkgrel=1
pkgdesc='A vim git wrapper so awesome, it should be illegal.'
arch=('any')
url='https://github.com/tpope/vim-fugitive'
license=('custom:vim')
groups=('vim-plugins')
depends=('vim' 'git')
conflicts=('vim-fugitive')
provides=('vim-fugitive')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git describe --always|cut -d 'v' -f2|sed -e 's|-|.|g' )"
}

package() {
  cd "${srcdir}/${_pkgname}"

  find autoload doc ftdetect plugin syntax -type f -exec \
    install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;

  install -Dm 644 doc/fugitive.txt \
    "${pkgdir}/usr/share/licenses/${_pkgname}/fugitive.txt"
}

# vim:set et ts=2 sw=2 tw=79:

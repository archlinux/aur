# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-yank-git
_pkgname=vim-coc-yank
_extname=coc-yank
pkgdesc='Yank highlight and persist yank history support for vim'
arch=('any')
url='https://github.com/neoclide/coc-yank'
depends=('vim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
license=('')
groups=('vim-coc-extras')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_extname}::git+${url}.git")
pkgver=1.1.3.r7.g7983c28
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
}

package() {
    cd "${srcdir}/${_extname}"
    find lib/*.js package.json -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

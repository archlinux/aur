# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-explorer-git
_pkgname=vim-coc-explorer
_extname=coc-explorer
pkgdesc='Explorer for coc.nvim'
arch=('any')
url='https://github.com/weirongxu/coc-explorer'
depends=('vim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
license=('')
groups=('vim-coc-extras')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_extname}::git+${url}.git")
pkgver=v0.7.23.r0.gbb631b5
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
    npm prune --production
}

package() {
    cd "${srcdir}/${_extname}"
    find autoload lib/*.js node_modules package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf node_modules
}

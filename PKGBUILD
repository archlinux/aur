# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-snippets-git
_pkgname=neovim-coc-snippets
_extname=coc-snippets
pkgdesc='Snippets solution for coc.nvim'
arch=('any')
url='https://github.com/neoclide/coc-snippets'
depends=('neovim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
license=('')
groups=('neovim-coc-extras-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_extname}::git+${url}.git")
pkgver=2.1.28.r0.ga36f36a
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
    find ftplugin lib/*.js package.json python syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

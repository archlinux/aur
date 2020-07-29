# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='neovim'
_extname=coc-tsserver
_packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
url='https://github.com/neoclide/coc-tsserver'
pkgdesc='Tsserver extension for coc.nvim that provide rich features like VSCode for javascript & typescript'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" 'git')
makedepends=('yarn' 'npm')
license=('')
source=("${_extname}::git+${url}.git")
pkgver=1.5.3.r3.g2d6d066
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
    yarn pack
    tar xvf *.tgz
    rm *.tgz
    cd package
    npm install --only=production --no-lockfile --ignore-scripts
}

package() {
    cd "${srcdir}/${_extname}/package"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
}

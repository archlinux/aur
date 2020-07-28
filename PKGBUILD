# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-git-git
_pkgname=vim-coc-git
_extname=coc-git
pkgdesc='Git integration of coc.nvim'
arch=('any')
url='https://github.com/neoclide/coc-git'
depends=('vim-coc' 'git')
makedepends=('yarn' 'npm')
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
license=('')
groups=('vim-coc-extras-git')
provides=("${_pkgname}-git")
conflicts=("${_pkgname}-git")
source=("${_extname}::git+${url}.git")
pkgver=1.8.1.r0.g691870e
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
    yarn pack --frozen-lockfile --production
    tar xvf *.tgz
    rm *.tgz
    cd package
    npm install --only=production
}

package() {
    cd "${srcdir}/${_extname}/package"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
}

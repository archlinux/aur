# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-marketplace-git
_pkgname=vim-coc-marketplace
_extname=coc-marketplace
pkgdesc='coc.nvim extensions marketplace'
arch=('any')
url='https://github.com/fannheyward/coc-marketplace'
depends=('vim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
license=('')
groups=('vim-coc-extras')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_extname}::git+${url}.git")
pkgver=v1.4.0.r109.ga1ec912
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
    find lib package.json -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

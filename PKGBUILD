# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='vim'
_colorscheme='forest-night'

pkgbase="${_variant}-${_colorscheme}-git"
pkgname=("${_variant}-${_colorscheme}-git"
         "${_variant}-airline-${_colorscheme}-git"
         "${_variant}-lightline-${_colorscheme}-git")
pkgver=v0.1.1.r40.gf4e0c92
pkgrel=1
arch=('any')
url="https://github.com/sainnhe/${_colorscheme}"
license=('MIT')
source=("${_colorscheme}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_colorscheme}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_vim-forest-night-git() {
    pkgdesc='Comfortable & Pleasant Color Scheme'
    depends=("${_variant}")
    provides=("${_variant}-${_colorscheme}")
    conflicts=("${_variant}-${_colorscheme}")
    cd "${srcdir}/${_colorscheme}"
    find colors -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
    install -Dm 644 "${srcdir}/${_colorscheme}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_vim-airline-forest-night-git() {
    pkgdesc="${_colorscheme} color scheme for airline"
    depends=("${_variant}-${_colorscheme}"
             'vim-airline')
    provides=("${_variant}-airline-${_colorscheme}")
    conflicts=("${_variant}-airline-${_colorscheme}")
    cd "${srcdir}/${_colorscheme}"
    find autoload/airline -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}

package_vim-lightline-forest-night-git() {
    pkgdesc="${_colorscheme} color scheme for lightline"
    depends=("${_variant}-${_colorscheme}"
             'vim-lightline-git')
    provides=("${_variant}-lightline-${_colorscheme}")
    conflicts=("${_variant}-lightline-${_colorscheme}")
    cd "${srcdir}/${_colorscheme}"
    find autoload/lightline -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}

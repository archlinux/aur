# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='neovim'
_colorscheme='edge'

pkgbase="${_variant}-${_colorscheme}-git"
pkgname=("${_variant}-${_colorscheme}-git"
         "${_variant}-airline-${_colorscheme}-git"
         "${_variant}-lightline-${_colorscheme}-git")
pkgver=0.1.3.r4.g3231c16
pkgrel=1
arch=('any')
url="https://github.com/sainnhe/${_colorscheme}"
license=('MIT')
source=("${_colorscheme}::git+${url}.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "${srcdir}/${_colorscheme}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_neovim-edge-git() {
    pkgdesc='Clean & Elegant Color Scheme inspired by Atom One and Material'
    depends=("${_variant}")
    provides=("${_variant}-${_colorscheme}")
    conflicts=("${_variant}-${_colorscheme}")
    cd "${srcdir}/${_colorscheme}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find doc colors -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/${_colorscheme}/start/${_colorscheme}/{}" \;
    find autoload/*.vim -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/{}" \;
    install -Dm 644 "${srcdir}/${_colorscheme}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_neovim-airline-edge-git() {
    pkgdesc="${_colorscheme} color scheme for airline"
    depends=("${_variant}-${_colorscheme}"
             'neovim-airline')
    provides=("${_variant}-airline-${_colorscheme}")
    conflicts=("${_variant}-airline-${_colorscheme}")
    cd "${srcdir}/${_colorscheme}"
    find autoload/airline -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/{}" \;
}

package_neovim-lightline-edge-git() {
    pkgdesc="${_colorscheme} color scheme for lightline"
    depends=("${_variant}-${_colorscheme}"
             'neovim-lightline')
    provides=("${_variant}-lightline-${_colorscheme}")
    conflicts=("${_variant}-lightline-${_colorscheme}")
    cd "${srcdir}/${_colorscheme}"
    find autoload/lightline -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/{}" \;
}

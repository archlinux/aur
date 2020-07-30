# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=vim-onedark-git
_pkgbase=vim-onedark
pkgname=('vim-onedark-git'
         'vim-airline-onedark-git'
         'vim-lightline-onedark-git')
pkgver=r196.c0f2207
pkgrel=1
arch=('any')
url='https://github.com/joshdick/onedark.vim'
license=('MIT')
makedepends=('git')
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-onedark-git() {
    pkgdesc="A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme."
    depends=('vim')
    optdepends=('vim-airline-onedark-git: onedark color scheme for airline'
                'vim-lightline-onedark-git: onedark color scheme for lightline')
    _pkgname=vim-onedark

    provides=("${_pkgbase}")
    conflicts=("${_pkgbase}")
    cd "${srcdir}/${_pkgbase}"
    find autoload/onedark.vim colors -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
    install -Dm 644 "${srcdir}/${_pkgbase}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.md"
}

package_vim-airline-onedark-git() {
    pkgdesc='OneDark color scheme for airline.'
    depends=('vim' 'vim-airline' 'vim-onedark')
    _pkgname=vim-airline-onedark
    provides=('vim-airline-onedark')
    conflicts=('vim-airline-onedark')
    cd "${srcdir}/${_pkgbase}"
    install -Dm 644 "${srcdir}/${_pkgbase}/autoload/airline/themes/onedark.vim" "${pkgdir}/usr/share/vim/vimfiles/pack/${_pkgbase}/start/${_pkgbase}/autoload/airline/themes/onedark.vim"
}

package_vim-lightline-onedark-git() {
    pkgdesc='OneDark color scheme for lightline.'
    depends=('vim' 'vim-lightline-git' 'vim-onedark')
    _pkgname=vim-lightline-onedark
    provides=('vim-lightline-onedark')
    conflicts=('vim-lightline-onedark')
    cd "${srcdir}/${_pkgbase}"
    install -Dm 644 "${srcdir}/${_pkgbase}/autoload/lightline/colorscheme/onedark.vim" "${pkgdir}/usr/share/vim/vimfiles/pack/${_pkgbase}/start/${_pkgbase}/autoload/lightline/colorscheme/onedark.vim"
}

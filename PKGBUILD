# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-visual-multi-git
_pkgname=vim-visual-multi
pkgver=v0.5.4.r11.gf317dca
pkgrel=1
pkgdesc='Multiple cursors plugin for vim/neovim'
arch=('any')
url='https://github.com/mg979/vim-visual-multi'
license=('MIT')
depends=('vim')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_pkgname}::git+${url}.git#branch=master"
        "${pkgname}.install"
        'vimtutor-visual-multi'
        'visual-multi-vim-doc.hook')
sha256sums=('SKIP'
            '10e9f3d21e7f5fce07f2e8ffab0ccd08cdb52f5097c84afaa355c06668faf046'
            '04d22ed7476c8c4ba565a805c8a3bac6e7252f6cc15106545e5c71dbb996229b'
            'cfdbc5aaa42b088365a4b99478a3efb56ab828a50e70e122f307ea2b8c3690bf')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    touch doc/tags
}

package() {
    cd "${srcdir}/${_pkgname}"
    find autoload doc plugin python tutorialrc -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}"/visual-multi-vim-doc.hook "${pkgdir}"/usr/share/libalpm/hooks/visual-multi-vim-doc.hook
    install -Dm 755 "${srcdir}"/vimtutor-visual-multi "${pkgdir}"/usr/bin/vimtutor-visual-multi
}

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
        'vimtutor-visual-multi')
sha256sums=('SKIP'
            '10e9f3d21e7f5fce07f2e8ffab0ccd08cdb52f5097c84afaa355c06668faf046'
            '04d22ed7476c8c4ba565a805c8a3bac6e7252f6cc15106545e5c71dbb996229b')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    vim -es --cmd ":helptags doc" --cmd ":q"
    find autoload doc plugin python tutorialrc -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 755 "${srcdir}"/vimtutor-visual-multi "${pkgdir}"/usr/bin/vimtutor-visual-multi
}

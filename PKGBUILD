# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname='neovim-lightline-git'
pkgver=r639.1b412cf
pkgrel=1
pkgdesc='A light and configurable statusline/tabline plugin'
url='https://github.com/itchyny/lightline.vim'
depends=('neovim')
makedepends=('git')
provides=('neovim-lightline')
arch=('any')
license=('MIT')
source=("lightline::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/lightline"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/lightline"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/{}" \;
    find doc plugin test -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/neovim-lightline/start/neovim-lightline/{}" \;
    install -Dm 644 "${srcdir}/lightline/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

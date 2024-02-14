pkgname=neovim-telescope-opt-git
_pkgname=telescope
pkgver=1173.776b509f
pkgrel=1
pkgdesc='Find, Filter, Preview, Pick. All lua, all the time.'
arch=('any')
url="https://github.com/nvim-${_pkgname}/${_pkgname}.nvim"
license=('MIT')
provides=('neovim-telescope')
depends=('neovim' 'plenary.nvim')
makedepends=('git')
optdepends=('ripgrep: required for live_grep and grep_string' 'fd: finder' 'neovim-treesitter: finder and previewer' 'neovim-lsp: picker' 'devicons: icons')
source=("${_pkgname}::git+${url}.git#branch=0.1.x")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

package() {

    cd "${srcdir}/${_pkgname}"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rvt "${pkgdir}/${_installpath}" autoload data doc ftplugin lua plugin scripts

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

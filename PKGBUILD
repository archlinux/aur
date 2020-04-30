pkgname=neovim-ultisnips-opt-git
_pkgname=ultisnips
pkgver=1511.ee31ea1
pkgrel=1
pkgdesc='The ultimate snippet solution for (neo)vim.'
arch=('any')
url="https://github.com/sirver/${_pkgname}"
license=('GPL3')
depends=('neovim' 'python')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

package() {

    cd "${srcdir}/${_pkgname}"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rvt "${pkgdir}/${_installpath}" pythonx after doc ftdetect autoload ftplugin plugin syntax

    find "${pkgdir}" -name '*.py' -exec python -mpy_compile {} +
    find "${pkgdir}" -name '*.py' -exec python -O -mpy_compile {} +

}

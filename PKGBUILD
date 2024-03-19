# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
_pkgname=vim-localvimrc
pkgname=${_pkgname}-git
pkgver=r246.841a064
pkgrel=1
pkgdesc="Search local vimrc files in the tree and load them."
arch=('any')
url="https://github.com/embear/vim-localvimrc"
license=('GPL-3.0-or-later')
groups=()
depends=('vim-plugin-runtime')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"

    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find doc plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}

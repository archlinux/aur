# Maintainer: mmh <aur@with-h.at>

_pkgname="minpac"

pkgname="neovim-${_pkgname}-git"
pkgver=v2.0.1.r20.544f2e6
pkgrel=1
pkgdesc="A minimal package manager for Neovim"
arch=('any')
url="https://github.com/k-takata/minpac"
license=('custom:VIM' 'custom:MIT')
groups=('neovim-plugins')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/k-takata/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -d "${pkgdir}/usr/share/nvim/site/pack/minpac/opt/minpac"
	cp -r 'autoload'  "${pkgdir}/usr/share/nvim/site/pack/minpac/opt/minpac"
	cp -r 'doc'       "${pkgdir}/usr/share/nvim/site/pack/minpac/opt/minpac"
	cp -r 'plugin'    "${pkgdir}/usr/share/nvim/site/pack/minpac/opt/minpac"
	install -D 'README.md' "${pkgdir}/usr/share/doc/neovim-minpac/README.md"
        # No LICENSE file provided by upstream
}

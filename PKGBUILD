# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Matteo Salonia <saloniamatteo[at]protonmail[dot]com> 
# Contributor: Pablo Arias <pabloariasal[at]gmail[dot]com>
# Contributor: John Jenkins <twodopeshaggy[at]gmail[dot]com>

pkgname=ddgr-git
_pkgname="${pkgname%-git}"
pkgver=2.1.r294.fedc902
pkgrel=1
pkgdesc="DuckDuckGo from the terminal (git version)"
arch=('any')
url="https://github.com/jarun/ddgr"
license=('GPL3')
depends=('python>=3.7.0')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${_pkgname}"
	
	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 "auto-completion/fish/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm 644 "auto-completion/bash/${_pkgname}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm 644 "auto-completion/zsh/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

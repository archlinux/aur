# Maintainer: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=nix-zsh-completions-git
_pkgname=nix-zsh-completions
pkgver=0.4.4.r13.g6a1bfc0
pkgrel=1
pkgdesc="ZSH Completions for Nix"
arch=(any)
url="https://github.com/nix-community/nix-zsh-completions"
license=(BSD)
depends=(zsh)
makedepends=(git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/nix-community/nix-zsh-completions.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"
	# Main completion functions (standalone, automatically loaded by compinit)
	install -m0644 -Dt "${pkgdir}/usr/share/zsh/site-functions" _*
	# OMZ plugin for extra functionalities (can be sourced from zshrc)
	install -m0644 -Dt "${pkgdir}/usr/share/zsh/plugins/${_pkgname}" "${_pkgname}.plugin.zsh"
	# Misc.
	install -m0644 -Dt "${pkgdir}/usr/share/doc/${_pkgname}" README.md
	install -m0644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}

# vim: set noet ff=unix:

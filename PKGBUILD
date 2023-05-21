# Maintainer: Rafael <rafaelrc7@gmail.com>

_pkgname=zsh-nix-shell
pkgname="${_pkgname}-git"
pkgver=0.7.0.r0.gdf48366
pkgrel=1
pkgdesc="zsh plugin that lets you use zsh in nix-shell shells."
arch=('any')
url="https://github.com/chisui/zsh-nix-shell"
license=('BSD')
depends=('zsh')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm644 nix-shell.plugin.zsh \
		"${pkgdir}/usr/share/zsh/plugins/${_pkgname}/nix-shell.plugin.zsh"
	install -Dm755 "./scripts/buildShellShim" \
		"${pkgdir}/usr/share/zsh/plugins/${_pkgname}/scripts/buildShellShim"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


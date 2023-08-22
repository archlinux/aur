# Maintainer: mehalter <micah at mehalter.com>

pkgname=astronvim
_pkgver=3.36.4
pkgver="v${_pkgver}"
pkgrel=1
pkgdesc="AstroNvim is an aesthetic and feature-rich neovim config that is extensible and easy to use with a great set of plugins"
arch=('any')
url="https://github.com/AstroNvim/AstroNvim"
license=('GPL3')
depends=("neovim>=0.8.0" "xclip")
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgver}.zip" "astronvim.vim.template")
sha256sums=(
	'5c5c939e8204556e3f9b74d2dbfd885fe3b93ea5257e740074809cb69b44e687'
	'a11c032b23e3892e9022aa32264cec022eddd25d39c874c36e70ed345ad05218'
)
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
	cd "$srcdir"
	install_dir="/usr/share/astronvim"
	echo -e "lua _G.astronvim_installation={home='${install_dir}', version='${_pkgver}', is_stable=true}\n$(cat astronvim.vim.template)" >astronvim.vim
	install -Dm 644 "astronvim.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/astronvim.vim"
	cd "AstroNvim-${_pkgver}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/astronvim"
	cp -r {init.lua,lua} "${pkgdir}/usr/share/astronvim"
}

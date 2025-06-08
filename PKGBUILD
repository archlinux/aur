# Maintainer: hockeymikey <hockeymikey@hockeymikey.com>

_pkgname=nvchad
pkgname=${_pkgname}-git
pkgver=r33.925399d
pkgrel=1
pkgdesc="NvChad is a neovim config written in lua aiming to provide a base configuration with very beautiful UI and blazing fast startuptime."
arch=('any')
url="https://github.com/NvChad/NvChad"
license=('GPL3')
depends=("neovim>=0.7.0" "xclip" "ripgrep" "ttf-jetbrains-mono-nerd")
source=("starter::git+https://github.com/NvChad/starter" "00-nvchad-defaults.lua" "init.lua")
sha256sums=('SKIP' 'fb3412a702f9c1609b22304761a06ebb0d70ae30cfe4010b738a7a0c6eecdcfb' 'b15c889d90db0df915a1005bec3484223c32e0418167820827481be17d8658e9')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd starter
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	root_nvim_dir="/usr/share/nvim/runtime/plugin"
	install -d "${pkgdir}${root_nvim_dir}/nvchad-starter"
	install -d "${pkgdir}${root_nvim_dir}/nvchad-starter/lua"

	cp -r "${srcdir}/starter/lua/" "${pkgdir}${root_nvim_dir}/nvchad-starter/"

	cat "${srcdir}/init.lua" "${srcdir}/starter/init.lua" > "${srcdir}/new_init.lua"
	install -Dm755 "${srcdir}/new_init.lua" "${pkgdir}${root_nvim_dir}/nvchad-starter/init.lua"
	install -Dm755 "${srcdir}/00-nvchad-defaults.lua" "${pkgdir}${root_nvim_dir}/00-nvchad-defaults.lua"
}


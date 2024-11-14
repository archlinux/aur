# Maintainer: hockeymikey <hockeymikey@hockeymikey.com>

_pkgname=nvchad
pkgname=${_pkgname}-git
pkgver=r28.d0c602f
pkgrel=1
pkgdesc="NvChad is a neovim config written in lua aiming to provide a base configuration with very beautiful UI and blazing fast startuptime."
arch=('any')
url="https://github.com/NvChad/NvChad"
license=('GPL3')
depends=("neovim>=0.7.0" "xclip" "ripgrep" "ttf-jetbrains-mono-nerd")
source=("starter::git+https://github.com/NvChad/starter" "init.lua")
sha256sums=('SKIP' 'e6be24a89a95769bec9d7decbcf0e5690b64795413cc6f769d8c3675d22292b6')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
	cd starter
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install_dir="/usr/share/nvchad"
	root_nvim_dir="/usr/share/nvim/runtime/plugin"
	install -d "${pkgdir}${install_dir}"
	install -d "${pkgdir}${root_nvim_dir}/nvchad-starter"

	install -Dm755 "${srcdir}/starter/init.lua" "${pkgdir}${install_dir}/init.lua"
	install -d "${pkgdir}${install_dir}/lua"
	cp -r "${srcdir}/starter/lua" "${pkgdir}${install_dir}"
	install -Dm755 "${srcdir}/init.lua" "${pkgdir}${root_nvim_dir}/nvchad-starter/init.lua"
}


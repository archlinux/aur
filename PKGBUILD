# Maintainer: Sahar Shulman <dillpickledev@gmail.com>
pkgname=easyboard
pkgver=0.1.0
pkgrel=2
pkgdesc="Whiteboard for Project Planning, Mind Mapping, Note Taking, and more."
arch=(x86_64 x86_32)
license=('Proprietary')

source=()

case "$CARCH" in
    x86_64)
    	source=("https://archive.org/download/easy-board-linux-v0.1.0.tar/EasyBoard_Linux.tar.gz")
      sha256sums+=("658da651515ff4c18cf5a19659ab4405fcec65df5741793b1e023ccbbdda0aff")
      ;;
    x86_32)
    	source=("https://archive.org/download/easy-board-linux-v0.1.0.tar/EasyBoard_Linux_x86_32.tar.gz")
			sha256sums=("a04eefb8913eb294fda810d024702c5f88bb37dd5886329781429b543055cae2")
    	;;
esac

_executable_base_name="EasyBoard"
_executable_name="${_executable_base_name}.${CARCH}"
_pck_name="${_executable_base_name}.pck"
_install_dir="/usr/share/${pkgname}"
_bin_dir="/usr/bin"
_desktop_file_dir="/usr/share/applications"
_desktop_file_name="${pkgname}.desktop"
_icons_dir="/usr/share/icons"
_icon_filetype="png"

_RUN_SCRIPT="#!/bin/bash
${_install_dir}/${_executable_name} \"\$@\""

package() {
	_root_dir="${srcdir}/.."
	mkdir -p "${pkgdir}/${_install_dir}"
	cp -f "${srcdir}/${_executable_name}" "${pkgdir}/${_install_dir}"
	cp -f "${srcdir}/${_pck_name}" "${pkgdir}/${_install_dir}"
	mkdir -p "${pkgdir}/${_bin_dir}"
	echo "${_RUN_SCRIPT}" > "${pkgdir}/${_bin_dir}/${pkgname}"
	chmod +x "${pkgdir}/${_bin_dir}/${pkgname}"
	mkdir -p "${pkgdir}/${_desktop_file_dir}"
	cp "${_root_dir}/${_desktop_file_name}" "${pkgdir}/${_desktop_file_dir}/${_desktop_file_name}"
	mkdir -p "${pkgdir}/${_icons_dir}"
	cp "${_root_dir}/${pkgname}.${_icon_filetype}" "${pkgdir}/${_icons_dir}/${pkgname}.${_icon_filetype}"
}

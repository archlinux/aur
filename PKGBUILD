# Maintainer: BogdanTheGeek <bogdan dot ionescu dot work at google mail com>

pkgname="e2studio"
pkgver=22.10.0
_pkg_file_name=e2studio_installer-2022-10_linux_host.run
pkgrel=1
pkgdesc="Eclipse-based integrated development environment (IDE) for Renesas MCU"
arch=("x86_64")
makedepends=()
depends=('swt' 'java-runtime' 'glibc' 'libusb')
optdepends=()
conflicts=()
url="https://www.renesas.com/us/en/software-tool/e-studio#download"
license=('Commercial')
options=(!strip)

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		echo ""
		echo "Package not found!"
		echo "The package can be downloaded here: ${url}"
		echo "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		echo ""
	fi
fi

source=()

prepare(){
	install -T -m755 ${HOME}/.swt/lib/linux/x86_64/libswt-pi3-gtk-4952r11.so ${HOME}/.swt/lib/linux/x86_64/libswt-pi4-gtk-4952r11.so
	if [ ! -f /usr/lib/libpcre.so.3 ]; then
		sudo install -T -m 644 /usr/lib/libpcre.so /usr/lib/libpcre.so.3
	fi
}

package() {
	cd "$srcdir"
	chmod +x ${_DOWNLOADS_DIR}/${_pkg_file_name}
}

install() {
  ${_DOWNLOADS_DIR}/${_pkg_file_name}
}

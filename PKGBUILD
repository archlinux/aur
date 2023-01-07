# Maintainer: James Beddek <$(base64 --decode <<<'dGVsYW5zQHBvc3Rlby5kZQo=')>

pkgname="vivado-boards-git"
pkgver=r193.c9000e6
pkgrel=1
pkgdesc="Vivado Board Files for Digilent FPGA Boards"

url="https://reference.digilentinc.com/reference/software/vivado/board-files"
license=("MIT")
arch=('any')

depends=('vivado')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+https://github.com/Digilent/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	for ver in $(find /opt/Xilinx/Vivado/ -mindepth 1 -maxdepth 1 -type d -printf "%f\n"); do
		mkdir -p "$pkgdir/opt/Xilinx/Vivado/${ver}/data/boards/board_files"
		cp -r new/board_files "$pkgdir/opt/Xilinx/Vivado/${ver}/data/boards/"
	done
}


# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname="digilent-vivado-scripts-git"
pkgver=1
pkgrel=1
pkgdesc="Tcl/python3 scripts to convert between git repos and Vivado/Xilinx SDK projects"
arch=('any')
url="https://github.com/Digilent/digilent-vivado-scripts"
license=("unknown")
depends=('xilinx-vivado-dummy')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Digilent/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	if git describe &>/dev/null; then
		printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	elif git describe --tags &>/dev/null; then
		printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
fi
}
package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/share/Digilent/${pkgname%-git}"
	cp -r * "$pkgdir/usr/share/Digilent/${pkgname%-git}"
}

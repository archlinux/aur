
# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname="vivado-library-git"
pkgver=v2018.2.1.r6.fd36d3e
pkgrel=1
pkgdesc="free-to-use IP cores and interface definitions compatible with Xilinx Vivado IP Catalog"
arch=('any')
url="https://reference.digilentinc.com/vivado:library"
license=("custom:MIT")
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
	mkdir -p "$pkgdir/usr/share/digilent/${pkgname%-git}"
	cp -r * "$pkgdir/usr/share/digilent/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-git}"
	mv "$pkgdir/usr/share/digilent/${pkgname%-git}/License.txt" "$pkgdir/usr/share/licenses/${pkgname%-git}"
}

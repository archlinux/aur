# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=simple-scan-to-pdf-git
pkgver=r22.19150f7
pkgrel=1
pkgdesc="A bash script for taking a folder of image files and outputting a PDF"
arch=('any')
url="https://github.com/AkBKukU/simple-scan-to-pdf"
license=('MIT')
depends=('python'  'python-wand' 'ocrmypdf')
makedepends=('git')
provides=("${pkgname%-git}" "scan2pdf")
conflicts=("${pkgname%-git}" "scan2pdf" )
source=('git+https://github.com/AkBKukU/simple-scan-to-pdf.git')
sha256sums=('SKIP')
install=scan2pdf.install

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "$srcdir/${pkgname%-git}/scan2pdf.py" "${pkgdir}/usr/bin/scan2pdf.py"
}

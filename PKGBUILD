# Maintainer: Viech

pkgname=osavul-git
pkgver=1.1.1.r5.g9628f8e
pkgrel=1
pkgdesc="A standalone server browser for Unvanquished."
arch=('x86_64')
url="https://www.unvanquished.net"
license=('GPL3')
depends=('qt4>=4.7')
makedepends=('git' 'make')
source=("osavul::git+https://github.com/Unvanquished/Osavul.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/osavul"

	git describe --match 'v*' --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/osavul"

	qmake-qt4
	make
}

package() {
	# Create installation directories.
	install -d -m 755 \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/applications" \
		"${pkgdir}/usr/share/licenses/osavul"

	cd "${srcdir}/osavul"

	# Install binaries.
	install -m 755 osavul "${pkgdir}/usr/bin/"

	# Install text files.
	install -m 644 debian/osavul.desktop "${pkgdir}/usr/share/applications/"
	install -m 644 LICENSE "${pkgdir}/usr/share/licenses/osavul/"
}

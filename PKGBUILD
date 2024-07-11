# Maintainer: smrqdt <smrqdt@posteo.de>
# Derived from cutecom PKGBUILD by:
#   Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
#   Contributor: Nils Bars <nils@nbars.de>

pkgname=cutecom-git
pkgver=0.51.0.r75.gadf0a20
pkgrel=1
pkgdesc="A graphical serial terminal (git master)"
arch=('x86_64')
url="https://gitlab.com/cutecom/cutecom"
license=('GPL-3.0-or-later')
conflicts=('cutecom')
depends=('qt6-serialport' 'hicolor-icon-theme')
makedepends=('cmake')
source=(${pkgname}::git+https://gitlab.com/cutecom/cutecom.git)
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# cutting off 'foo-' prefix that presents in the git tag
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/$pkgname

	cmake .
	cmake --build .

}

package() {
	cd ${srcdir}/$pkgname
	install -D -m 644 cutecom.desktop ${pkgdir}/usr/share/applications/cutecom.desktop
	install -D -m 644 images/cutecom.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutecom.svg
	install -D -m 755 cutecom ${pkgdir}/usr/bin/cutecom
	install -D -m 644 cutecom.1 ${pkgdir}/usr/share/man/man1/cutecom.1
}

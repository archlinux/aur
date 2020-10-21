# Maintainer: doragasu: doragasu <yawn> hotmail <roll> com

pkgname=siggen
pkgver=2.3.10
pkgrel=4
pkgdesc="Curses based signal generator"
arch=('i686' 'x86_64')
url="https://packages.debian.org/wheezy/siggen"
license=('GPL2')
depends=('ncurses')
install="${pkgname}.install"

source=("http://http.debian.net/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
	"segfault-and-install.patch"
	"fix_gcc10_build.patch")
sha256sums=('10f2749d144675c0faf37bffa276b49cbb2d44388a087928808acf5d0b0914fc'
            'be323506fc641c7057b31d48e9e66d7a0c6abc4c365d18b05061dd43d67b7b31'
            'e7abc00ca8f1137ea74596ba9dff704a460c25175f33687d7e5d03b04e966231')
PKGEXT=".pkg.tar.zst"

build() {
	# Apply patch to fix installation path and some segfaults
	patch -p0 < segfault-and-install.patch
	patch -p0 < fix_gcc10_build.patch
	# Make everything
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	INSDIR=${pkgdir}/usr/bin MANDIR=${pkgdir}/usr/share/man make sysinstall
}


# Mantainer: Berseker <berseker86 at gmail.com>

pkgname=viewnior-git
pkgver=viewnior.0.5.r108.ga045b96
pkgrel=1
pkgdesc="Simple, fast, elegant and minimalistic image viewer, written in C(GTK+) with a new GtkImageView library. Git Version"
arch=('i686' 'x86_64')
url='http://xsisqox.github.com/Viewnior/'
license=('GPL')
depends=('cairo-ubuntu' 'hicolor-icon-theme' 'gtk2' 'desktop-file-utils')
makedepends=('gnome-common' 'intltool')
provides=('viewnior')
install="${pkgname}.install"
conflicts=('viewnior')
options=('strip')
source=("viewnior-git::git+https://github.com/xsisqox/Viewnior.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}



build()
{
	cd "${srcdir}/${pkgname}"
	rm -rf "${srcdir}/${pkgname}/build"
	sed -i 's/AM_PROG_CC_STDC/AC_PROG_CC/g' configure.ac
	./autogen.sh

	LDFLAGS='-lm' ./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} install
}

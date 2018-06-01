# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Berseker <berseker86 at gmail.com>

pkgname=viewnior-git
pkgver=1.7.r2.gaac0a0c
pkgrel=1
pkgdesc="Simple, fast, elegant and minimalistic image viewer, written in C(GTK+) with a new GtkImageView library. Git Version"
arch=('i686' 'x86_64')
url='http://siyanpanayotov.com/project/viewnior'
license=('GPL')
depends=('exiv2' 'gtk2')
makedepends=('gnome-common' 'intltool' 'meson' 'ninja')
provides=('viewnior')
conflicts=('viewnior')
source=("${pkgname}::git+https://github.com/hellosiyan/Viewnior.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/viewnior.//'
}



build()
{
	cd "${srcdir}/${pkgname}"
	meson builddir --prefix=/usr
	ninja -C builddir
}

package()
{
	cd "${srcdir}/${pkgname}"
	DESTDIR="${pkgdir}" ninja -C builddir install
}

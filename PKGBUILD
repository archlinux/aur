# Maintainer: Robin Thompson <robin*dot*thompson99*at*gmail*dot*com>
_pkgname=gladrags
pkgname=gladrags-gtk3-git
pkgver=0.22.r0.gc44c89f
pkgrel=1
epoch=
pkgdesc="An applet to smarten up MATE panels"
arch=('any')
url="https://github.com/robint99/gladrags"
license=('GPLv3')
depends=("mate-panel-gtk3" "python" "python-gobject" "imagemagick")
makedepends=("git")
install="gladrags-gtk3.install"
source=("git+http://github.com/robint99/gladrags")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/gladrags"
        aclocal
        automake --add-missing
        autoreconf
	./configure --prefix=/usr --with-gtk3 --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/gladrags"
	make DESTDIR="$pkgdir/" install
}

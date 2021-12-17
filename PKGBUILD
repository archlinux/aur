# Contributor: Jan Kašpar <jan.kaspar at gmail dot com>

pkgname=gdigi
pkgver=0.4.0
pkgrel=2

pkgdesc="gdigi provides Digitech X-Edit functionality to Linux users"
arch=('i686' 'x86_64')
url="https://desowin.org/gdigi/"
license=('GPL')
depends=('alsa-lib' 'gtk3' 'glib2' 'expat')
makedepends=('make')

source=(
	"https://sourceforge.net/projects/gdigi/files/gdigi/$pkgver/$pkgname-$pkgver.tar.bz2"
	"gdigi.h.patch"
)

md5sums=(
	"62084296b81d3f888a7aee26a5f44842"
	"02d879d5581ab74524c6193b067fbbc0"
)

prepare()
{
	cd "$srcdir/$pkgname-$pkgver"

	patch -p0 < "$srcdir/gdigi.h.patch"
}

build()
{
	cd "$srcdir/$pkgname-$pkgver"

	make || return 1
}

package()
{
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons"
	make DESTDIR="$pkgdir" install
}

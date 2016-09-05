# Contributor: Jan Kašpar <jan.kaspar at gmail dot com>
pkgname=xrootd
pkgver=4.4.0
pkgrel=2
pkgdesc="The XROOTD project aims at giving high performance, scalable fault tolerant access to data repositories of many kinds."
arch=('i686' 'x86_64')
url="http://xrootd.org/"
license=('Stanford, Jr. University')
depends=()
makedepends=('make' 'cmake')

source=(
	"http://xrootd.org/download/v$pkgver/xrootd-$pkgver.tar.gz"
)

md5sums=(
	'58f55e56801d3661d753ff5fd33dbcc9'
)

build()
{
	cd "$srcdir"

	rm -rf "build"
	mkdir "build"
	cd "build"

	cmake "$srcdir/xrootd-$pkgver" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib || return 1
	make || return 2
}

package()
{
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}

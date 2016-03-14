# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Richard Schwab <mail NOSPAM w.tf-w.tf>

pkgname=libiphone-git
pkgver=1.2.0.r13.gdf1f5c4
pkgrel=1
pkgdesc="libiphone is a software library that talks the native Apple USB protocols that the iPhone uses. (no cython support for now)"
url="http://libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnutls'
#	'fuse'
#	'glib2'
	'libplist'
	'libusb'
#	'libxml2'
#	'libxml++' 
	'usbmuxd')
makedepends=('autoconf'
	'automake'
	'gcc'
	'git'
	'make'
	'pkgconfig')
optdepends=('doxygen: Documentation')
provides=('libiphone')
source=('libiphone::git+http://git.sukimashita.com/libimobiledevice.git'
	'SSLv23.patch')
md5sums=('SKIP'
         '1cf25e39d353e02c7c8daaa41bd671e9')

prepare() {
	cd libiphone
	patch -p1 < ../SSLv23.patch
}

pkgver() {
	cd libiphone
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd libiphone

	msg "Configuring..."

	./autogen.sh --prefix=/usr --without-cython

	msg "Starting make..."
	make
}

package() {
	cd libiphone
	make DESTDIR=${pkgdir} install
}

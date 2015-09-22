# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Richard Schwab <mail NOSPAM w.tf-w.tf>

pkgname=libiphone-git
pkgver=20150922
#pkgver=1.1.5.23.g41ba99e
#epoch=1
pkgrel=1
pkgdesc="libiphone is a software library that talks the native Apple USB protocols that the iPhone uses. (no cython support for now)"
url="http://libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnutls' 'libusb' 'fuse' 'glib2' 'libxml2' 'libxml++' 'libplist' 'usbmuxd')
makedepends=('gcc' 'git' 'automake' 'autoconf' 'make' 'pkgconfig')
optdepends=('doxygen: Documentation')
#optdepends=('cython: Python bindings' 'doxygen: Documentation')
provides=('libiphone')
source=('libiphone::git+http://git.sukimashita.com/libimobiledevice.git')
md5sums=(SKIP)

pkgver() {
	cd libiphone
	git describe --tags | sed "s/-/./g"
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

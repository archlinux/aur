# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Nikias Bassen
# Contributor: Martin Szulecki

pkgname=libiphone-git
_pkgname=libimobiledevice
pkgver=1.2.0.r41.ga1c7285
pkgrel=1
pkgdesc="libiphone is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('gnutls' 'openssl' 'libplist' 'libusbmuxd')
optdepends=('cython: Python bindings'
            'doxygen: Documentation')
makedepends=('git')
provides=('libiphone' "$_pkgname")
conflicts=('libiphone' "$_pkgname")

source=("git+https://github.com/$_pkgname/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install
}

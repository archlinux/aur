# Maintainer: Dominic Meiser dosm dot mail at gmail

pkgname=qtwebapp-cmake
pkgver=1.7.11
pkgrel=1
pkgdesc="Fork of QtWebApp using CMake as build system. QtWepApp is a HTTP server library in C++, inspired by Java Servlets."
arch=('x86_64' 'armv7h')
url="https://gitlab.com/msrd0/QtWebApp"
license=('LGPL')
depends=('cmake' 'qt5-base')
makedepends=('git')
source=("qtwebapp::git+https://gitlab.com/msrd0/qtwebapp.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare()
{
	cd "$srcdir/qtwebapp/QtWebApp"
	mkdir -p build
}

build()
{
	cd "$srcdir/qtwebapp/QtWebApp/build"
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package()
{
	cd "$srcdir/qtwebapp/QtWebApp/build"
	make install DESTDIR="$pkgdir"
}

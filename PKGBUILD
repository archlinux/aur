# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Mario Steele <mario@ruby-im.net>

pkgname=autovala
pkgver=1.15.1
pkgrel=1
pkgdesc="A program that automatically generates CMake and Meson configuration files for your Vala project"
arch=('x86_64')
url="https://gitlab.com/rastersoft/autovala"
license=('GPL3')
groups=('vala')
depends=('make'
				 'vte3'
				 'libgee'
				 'bash-completion')
makedepends=('vala'
						 'cmake'
						 'libgee'
						 'gtk3'
						 'pandoc'
						 'bash-completion'
						 'gobject-introspection')
install=autovala.install
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/rastersoft/autovala/-/archive/${pkgver}/autovala-${pkgver}.tar.gz")
sha256sums=('af77e46d7ac50eb34e63ab5477a1f94f696f05fae41b21282961819820051f4b')

build() {
	cd "${pkgname}-${pkgver}"
	rm -rf build
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="/usr/lib" .. 
	make
}

package() {
	cd "${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
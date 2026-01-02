# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=onvif-util
pkgver=1.4.9
pkgrel=1
pkgdesc='A client side implementation of the ONVIF specification - CLI app'
url='https://github.com/sr99622/libonvif'
license=('LGPL-2.1-or-later')
arch=('i686' 'x86_64')
makedepends=('cmake'
             'git')
source=("git+${url}.git#commit=ad941d342320e58caa3b9b6b95e2bcccb44285ff")
sha256sums=('e14c75c6917baf19f51c36d0c8490368d13e2b57544a7d00451de8811cc4c443')

pkgver() {
	cd ${srcdir}/libonvif/${pkgname}
	sed -n -e '/onvif-util VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/libonvif/${pkgname}
	cmake -B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd ${srcdir}/libonvif/${pkgname}
	install -D -m 755 -t ${pkgdir}/usr/bin build/${pkgname}
	install -D -m 644 -t ${pkgdir}/usr/share/man/man1 docs/${pkgname}.1
}

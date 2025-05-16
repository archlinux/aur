# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=onvif-util
pkgver=1.4.7
pkgrel=2
pkgdesc='A client side implementation of the ONVIF specification - CLI app'
url='https://github.com/sr99622/libonvif'
license=('LGPL-2.1-or-later')
arch=('i686' 'x86_64')
makedepends=('cmake'
             'git')
# _prjrel=3.0.10
source=("git+${url}.git#commit=2f03007de328e5da5dfd771989fa0f406529ad24")
sha256sums=('b54485dc8c3abc1dc9c94206dc364163a2a3c2b80a7fa371f129c78767001db1')

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

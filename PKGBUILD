# Maintainer: Loic Blot <loic.blot@unix-experience.fr>
pkgname=libluasandbox
pkgver=1.2.6
pkgrel=1
pkgdesc="Generic Lua sandbox for dynamic data analysis"
source=("https://github.com/mozilla-services/lua_sandbox/archive/v$pkgver.tar.gz")
sha256sums=('1d58a9087fb1f0f75db23c02cc91ec429dc9c6c46f2e0fadadbeca108f43c3c7')
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('cmake')

_buildroot="release"
build() {
	cd lua_sandbox-$pkgver
	mkdir $_buildroot
	cd $_buildroot
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	make
}

package() {
	cd lua_sandbox-${pkgver}/${_buildroot}
	make install
	mv ${pkgdir}/usr/lib64 ${pkgdir}/usr/lib
	sed -i 's/lib64/lib/g' ${pkgdir}/usr/share/luasandbox/cmake/luasandboxConfig.cmake
}

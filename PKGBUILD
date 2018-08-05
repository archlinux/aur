# Maintainer: Loic Blot <loic.blot@unix-experience.fr>
pkgname=libluasandbox
pkgver=1.3.0
pkgrel=1
pkgdesc="Generic Lua sandbox for dynamic data analysis"
source=("https://github.com/mozilla-services/lua_sandbox/archive/v$pkgver.tar.gz")
sha256sums=('986e21efc1af15c866b9766c4c79266ef033aa6a816bb250370d7dc81bd91068')
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

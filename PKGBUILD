# Maintainer: 13thfloorelevators <the13thfloorelevators@protonmail.com> <BURST-737A-XKSG-M424-67UVT>
                                                                                                                      
pkgname=cloudburstlib-git
_realname=BurstLib
_realname2=TestClient
pkgver=r16.r0.g83adabc                                
pkgrel=1                                                  
pkgdesc="A cross platform dynamic library for BURST, also gives direct access to BURST Extensions"
arch=('x86_64')                        
url="htttps://github.com/CurbShifter/BurstLib"
license=('GPL3')
makedepends=('boost' 'git' 'curl')
source=("git+https://github.com/CurbShifter/BurstLib.git")
sha256sums=('SKIP')
pkgver() {
	cd "${srcdir}/${_realname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_realname}/Builds/LinuxMakefile" 
	make CONFIG=Release
	cd "${srcdir}/${_realname}/TestClient/Builds/LinuxMakefile"
	make CONFIG=Release
}

package() { 
	cd "${srcdir}/${_realname}/Builds/LinuxMakefile/build"
	install -Dm755 "${_realname}.so" "${pkgdir}$/usr/bin/${_realname}.so"
	cd "${srcdir}/${_realname}/TestClient/Builds/LinuxMakefile/build"
	install -Dm755 "${_realname2}" "${pkgdir}/usr/bin/${_realname2}"
}

# Maintainer: 13thfloorelevators <the13thfloorelevators@protonmail.com>
                                                                                                                      
pkgname=cloudburstlib-git
_realname=BurstLib
_realname2=TestClient
pkgver=r11.r2.g01fd87f                                 
pkgrel=1                                                  
pkgdesc="BURST's Cloudburst Dapp and dynamic lib"
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

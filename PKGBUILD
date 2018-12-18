# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname=native-proxy
pkgver=1.0
pkgrel=1
pkgdesc="Dynamic Dispatch to C Libraries from Java"
arch=('x86_64')
url="https://bitbucket.org/Scoopta/native-proxy/src/default/"
license=('GPL3')
depends=('jdk-openjdk>=11')
makedepends=('mercurial')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
validpgpkeys=()

prepare() {
	mkdir -p "${pkgname}-${pkgver}"
	hg clone ${url} "${pkgname}-${pkgver}"
}

build() {
	cd "${pkgname}-${pkgver}"
	./gradlew build 
	./gradlew linuxPackage
	cd ..
}


package() {
	mkdir -p "../pkg/${pkgname}/usr/share/java"
	cp ${pkgname}-${pkgver}/build/libs/*.jar "../pkg/${pkgname}/usr/share/java/"
}

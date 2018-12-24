# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname=jaybar
pkgver=1.0.51a9d7678d1b752ce40164d40ea47a210375388f
pkgrel=1
epoch=
pkgdesc="Status bar for the Sway Compositor"
arch=('x86_64')
url="https://bitbucket.org/Scoopta/jaybar/src/default/"
license=('GPL3')
groups=()
depends=('native-proxy' 'jwl' 'jgtk+' 'jlibc' 'wlroots'  'wayland' 'jdk-openjdk>=11')
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

pkgver() {
	echo "1.0"
}

prepare() {
	pkgver=1.0
	mkdir -p "${pkgname}-${pkgver}"
	hg clone ${url} "${pkgname}-${pkgver}"
}

build() {
	pkgver=1.0
	cd "${pkgname}-${pkgver}"
        ./gradlew build
	./gradlew linuxPackage
        cd ..
}

check() {
	echo "Checking"
}

package() {
	pkgver=1.0
	echo "Packaging"
	mkdir -p "../pkg/${pkgname}/usr/share/java"
	mkdir -p "../pkg/${pkgname}/usr/bin"
        cp ${pkgname}-${pkgver}/build/libs/*.jar "../pkg/${pkgname}/usr/share/java/"
	cp ${pkgname}-${pkgver}/build/libs/jaybar "../pkg/${pkgname}/usr/bin/"
}

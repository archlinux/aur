# Maintainer: Matt Mathis <aur@cloudninja.pw>
pkgname=jaybar
pkgver=51a9d7678d1b
pkgrel=1
srcdir="src"
epoch=
pkgdesc="Status bar for the Sway Compositor"
arch=('x86_64')
url="https://bitbucket.org/Scoopta/jaybar/src/default/"
license=('GPL3')
groups=()
depends=('native-proxy' 'jwl' 'jgtk+' 'jlibc' 'wlroots'  'wayland' 'jdk-openjdk>=11')
makedepends=('mercurial')
source=("${pkgname}::hg+$url")
sha256sums=('SKIP')
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
	mkdir -p ${srcdir}/${pkgname}
	cd ${srcdir}/${pkgname}
	echo $(hg identify -i)
}
build() {
	cd $pkgname
	./gradlew build
        ./gradlew linuxPackage
        cd ..
}
package() {
	mkdir -p "../pkg/${pkgname}/usr/share/java"
	mkdir -p "../pkg/${pkgname}/usr/bin"
	cp ${pkgname}/build/libs/*.jar "../pkg/${pkgname}/usr/share/java/"
	cp ${pkgname}/build/libs/jaybar "../pkg/${pkgname}/usr/bin/"
}

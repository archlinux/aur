# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jaco Malan <jacomalan.12@gmail.com>
pkgname=rkimer-git
pkgver=r11.e87495b
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/Code-Log/rkimer"
license=('GPL3')
makedepends=('jdk-openjdk')
provides=('rkimer')
source=('rkimer::git+https://github.com/Code-Log/rkimer#branch=master')
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd $srcdir/rkimer
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/rkimer	
	./gradlew fatJar
}

package() {
	mkdir -p "$pkgdir/usr/share/java/rkimer"
	cp "$srcdir/rkimer/app/build/libs/rkimer.jar" "$pkgdir/usr/share/java/rkimer/rkimer.jar"
	mkdir -p "$pkgdir/usr/bin"
	pwd
	cp ../rkimer.sh "$pkgdir/usr/bin/rkimer"
	chmod +x "$pkgdir/usr/bin/rkimer"
}

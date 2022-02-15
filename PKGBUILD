# Maintainer: Jaco Malan <jacomalan.12@gmail.com>

pkgname=rkimer-git
pkgver=r27.b521419
pkgrel=1
pkgdesc="A lightweight speedcubing timer written in Kotlin"
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

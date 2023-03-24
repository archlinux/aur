# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Lia Brueggemann <brueggemann.l@proton.me>
pkgname=sherly-git
_pkgname=Sherly
pkgver=1.1.4
pkgrel=1
epoch=
pkgdesc="Sherly is a Multithreaded Duplicate File Finder for your Terminal, written in java"
arch=('any')
url="https://github.com/BlyDoesCoding/Sherly"
license=('BSD2')
groups=()
depends=('jre>=1.19.0')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('sherly')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/$_pkgname"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir -p Bin
	javac -d Bin src/*.java -Xlint
	cd Bin
	jar cfe sherly.jar Main ConsoleColors.class Main.class ThreadedCompare.class
}


package() {
	cd "$srcdir/$_pkgname"

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/java/"
	mkdir -p "${pkgdir}/usr/share/java/sherly"
	echo copy
	cp Bin/sherly.jar "${pkgdir}/usr/share/java/sherly/sherly.jar"
	cp src/sherly "${pkgdir}/usr/bin/sherly"
	chmod +x "${pkgdir}/usr/bin/sherly"
}



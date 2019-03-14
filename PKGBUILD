# Maintainer: Dominic Meiser

pkgname=gradle-profiler-git
pkgver=r398.5165bcf
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('gradle')
makedepends=('libarchive')
source=("$pkgname::git+https://github.com/gradle/gradle-profiler")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	
	./gradlew distTar
}

package() {
	cd "$srcdir/$pkgname"
	
	mkdir -p "$pkgdir/usr/"{bin,share}
	bsdtar xf "build/distributions/gradle-profiler.tar" -C "$pkgdir/usr/share/"
	rm "$pkgdir/usr/share/gradle-profiler/bin/gradle-profiler.bat"
	ln -s "/usr/share/gradle-profiler/bin/gradle-profiler" "$pkgdir/usr/bin/"
}

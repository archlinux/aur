# Maintainer: otreblan <otreblain@gmail.com>

pkgname=glsl_analyzer
pkgver=1.0.7
pkgrel=1
pkgdesc='Language server for GLSL (autocomplete, goto-definition, formatter, and more)'
arch=('x86_64')
url="https://github.com/nolanderc/glsl_analyzer"
license=('GPL3')
depends=('glibc')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('996302ae03e9501731b73cf7a587b9139cf5e06ffe5ceb79e1c8b14ca0be312d')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i "s/b.exec(&.{ \"git\", \"describe\", \"--tags\" })/\"v$pkgver\"/" build.zig
}

build() {
	cd "$pkgname-$pkgver"

	DESTDIR="build" zig build \
		--prefix /usr \
		--search-prefix /usr \
		-Dtarget=native-linux.5.15-gnu \
		-Doptimize=ReleaseSafe \
		-Dcpu=baseline
}

package() {
	cd "$pkgname-$pkgver"

	cp -a build/* "$pkgdir"
}

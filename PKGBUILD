# Maintainer: Torsten Hilgenberg <th@zoon.cc>

pkgname=cplot
pkgver=2.0
pkgrel=1
pkgdesc='Function plotter for real and complex mathematical functions'
url='https://zoon.cc/cplot/'
license=('MIT')
arch=('x86_64')

depends=('zlib' 'sdl2' 'libgl' 'glu' 'glew' 'glibc' 'pango' 'cairo')
makedepends=('git' 'python>=3.0.0' 'ninja' 'boost')
source=('git+https://github.com/hilgenberg/cplot#commit=a8b8f5f6ad42698c36cc55710a616c304aa56bb5')
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/cplot/"
	git submodule update --init --recursive --depth 1
}

build() {
	cd "$srcdir/cplot/"
	./build release
}

package() {
	cd "$srcdir/cplot/"
	install -Dm755 -t "$pkgdir/usr/bin/" build_release/cplot
	install -Dm644 -t "$pkgdir/usr/share/cplot/" Plot\ Examples/*.cplot
	install -Dm644 -t "$pkgdir/usr/share/licenses/cplot/" LICENSE
}

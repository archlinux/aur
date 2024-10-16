# Maintainer: David Garfias <dgarfiasme at gmail dot com>
pkgname=gfxstream
pkgver=0.1.2
pkgrel=1
pkgdesc="Graphics Streaming Kit (colloquially known as Gfxstream) is a code generator that makes it easier to serialize and forward graphics API calls from one place to another."
arch=("x86_64")
url="https://android.googlesource.com/platform/hardware/google/gfxstream/"
license=("Apache-2.0")
source=('git+https://android.googlesource.com/platform/hardware/google/gfxstream#tag=v0.1.2-gfxstream-release')
sha256sums=('SKIP')
makedepends=(meson git ninja clang)
depends=(libaemu mesa glu freeglut libdrm)

prepare() {
	cd $srcdir/gfxstream
	mkdir build
}

build() {
	cd $srcdir/gfxstream
	CC=clang CXX=clang++ arch-meson . build
	meson compile -C build
}
package() {
	cd $srcdir/gfxstream
	meson install -C build --destdir "$pkgdir"
}

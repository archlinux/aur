# Maintainer: David Garfias <dgarfiasme at gmail dot com>
pkgname=rutabaga-ffi
pkgver=0.1.3
pkgrel=1
pkgdesc="The Rutabaga Virtual Graphics Interface (VGI) is a cross-platform abstraction for GPU and display virtualization."
arch=("x86_64")
url="https://crosvm.dev/book/appendix/rutabaga_gfx.html"
license=(custom:chromiumos)
source=('git+https://chromium.googlesource.com/crosvm/crosvm#tag=v0.1.3-rutabaga-release')
sha256sums=('SKIP')
makedepends=(rust git)
depends=(virglrenderer gfxstream)

build() {
	cd $srcdir/crosvm/rutabaga_gfx/ffi
	RUSTFLAGS='-Clink-arg=-L='/usr/lib/ make
}
package() {
	cd $srcdir/crosvm/rutabaga_gfx/ffi
	make prefix="$pkgdir/usr/" install
	install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

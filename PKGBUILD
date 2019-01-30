# Maintainer: Tesx <tesfabpel@gmail.com>
pkgname=goxel
pkgver=0.8.2
pkgrel=1
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux."
arch=('i686' 'x86_64')
url="https://guillaumechereau.github.io/goxel/"
license=('GPL3')
groups=()
makedepends=(scons pkg-config patch clang)
depends=(glfw gtk3)
source=("https://github.com/guillaumechereau/$pkgname/archive/v$pkgver.tar.gz"
	"goxel.desktop"
	"goxel.png"
	"fix-compile.patch")
sha256sums=('4f8297560e356cb69469e0a23bcb4e9c4e8549766a0466ffeaa0c9cfb7a04049'
	'9b29df7405a9593396bc7ea810dc2871cce7c4ee474c1fa56d32f56c2ca2d921'
	'f857497012b8518817e321ff8e1e9f108c8e18b638285702f2041f82769d2652'
	'8ef0df798c0e907f599025c6d5c6b6366b50728ff395addad78db2dd521d8890')

build() {
	cd "$pkgname-$pkgver"
	make release
}

prepare() { 
	cd "$pkgname-$pkgver" 
	patch Makefile "${srcdir}/fix-compile.patch" 
}

package() {
	install -Dm644 goxel.desktop "$pkgdir/usr/share/applications/goxel.desktop"
	install -Dm644 goxel.png "$pkgdir/usr/share/icons/goxel.png"
	
	cd "$pkgname-$pkgver"
	install -Dm755 goxel "$pkgdir/usr/bin/goxel"
}

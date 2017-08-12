# Maintainer: Tesx <tesfabpel@gmail.com>
pkgname=goxel
pkgver=0.7.0
pkgrel=1
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux."
arch=('i686' 'x86_64')
url="https://guillaumechereau.github.io/goxel/"
license=('GPL3')
groups=()
makedepends=(scons pkg-config patch)
depends=(glfw gtk3)
source=("https://github.com/guillaumechereau/$pkgname/archive/v$pkgver.tar.gz"
	"goxel.desktop"
	"goxel.png"
	"wno-error.patch")
sha256sums=('10eefdf481ec0222b49441a2e4dd943aab49118275914ab935553ebf295bc870'
	'9b29df7405a9593396bc7ea810dc2871cce7c4ee474c1fa56d32f56c2ca2d921'
	'f857497012b8518817e321ff8e1e9f108c8e18b638285702f2041f82769d2652'
	'ca9f98d28f54e5e29f9158da527f0f3149b2211a8862c424d98d481399efa347')

build() {
	cd "$pkgname-$pkgver"
	make release
}

prepare() { 
	cd "$pkgname-$pkgver" 
	patch Makefile "${srcdir}/wno-error.patch" 
}

package() {
	install -Dm644 goxel.desktop "$pkgdir/usr/share/applications/goxel.desktop"
	install -Dm644 goxel.png "$pkgdir/usr/share/icons/goxel.png"
	
	cd "$pkgname-$pkgver"
	install -Dm755 goxel "$pkgdir/usr/bin/goxel"
}

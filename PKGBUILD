# Maintainer: Tesx <tesfabpel@gmail.com>
pkgname=goxel
pkgver=0.4.0
pkgrel=1
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux."
arch=('i686' 'x86_64')
url="https://guillaumechereau.github.io/goxel/"
license=('GPL3')
groups=()
makedepends=(scons pkg-config)
depends=(glfw gtk3)
source=("https://github.com/guillaumechereau/$pkgname/archive/v$pkgver.tar.gz"
	"wno-error.patch"
	"goxel.desktop")
sha256sums=('eb18c201150f4a137839df2d197c7f9596326a00fad6e6c26cc60f22e9f3439c'
	'481125eb004e777d1a474a75f04335126f4137c960f60525235735550c2889cf'
	'a8b60dfaa8ada674cccce89c6b7007cc8915b4a332c02123bd7cea6a73c2d1d8')

prepare() {
	cd "$pkgname-$pkgver"
	patch SConstruct "${srcdir}/wno-error.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make release
}

package() {
	install -Dm644 goxel.desktop "$pkgdir/usr/share/applications/goxel.desktop"
	
	cd "$pkgname-$pkgver"
	install -Dm755 goxel "$pkgdir/usr/bin/goxel"
}

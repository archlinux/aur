# Maintainer: Tesx <tesfabpel@gmail.com>
pkgname=goxel
pkgver=0.3.0
pkgrel=1
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux."
arch=('i686' 'x86_64')
url="https://guillaumechereau.github.io/goxel/"
license=('GPL3')
groups=()
makedepends=(scons pkg-config)
depends=(glfw gtk3)
source=("https://github.com/guillaumechereau/$pkgname/archive/v$pkgver.tar.gz"
	"wno-error.patch")
sha256sums=('fad0a2ab772402a47437fc6e11372a40e5c992bcc8377b4c31de684b23d5079e'
	'481125eb004e777d1a474a75f04335126f4137c960f60525235735550c2889cf')

prepare() {
	cd "$pkgname-$pkgver"
	patch SConstruct "${srcdir}/wno-error.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make release
}

package() {
	cd "$pkgname-$pkgver"
	
	install -Dm755 goxel "$pkgdir/usr/bin/goxel"
}

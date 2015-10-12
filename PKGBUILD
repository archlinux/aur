# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=dmagick
pkgver=6.9.1
pkgrel=1
pkgdesc="D wrapper for ImageMagick"
arch=("i686" "x86_64")
url="https://github.com/MikeWey/DMagick"
license=('unknown')
depends=("dmd" "dtools" "imagemagick")
source=(
	"https://github.com/MikeWey/DMagick/archive/ImageMagick_$pkgver.tar.gz"
	"fix-build.patch"
)
md5sums=(
	"be793d786e8cc594871b8e2792bf4a73"
	"fd3a86e7acbea6d9a19bfb3ac071da25"
)

prepare() {
	cd "DMagick-ImageMagick_$pkgver"
	patch -Np1 -i ../fix-build.patch
}

build() {
	cd "DMagick-ImageMagick_$pkgver"
	sed -i "s/prefix=.*/prefix=\\/usr/" GNUmakefile
	make
}

package() {
	cd "DMagick-ImageMagick_$pkgver"
	make DESTDIR="$pkgdir/" install
}

# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>
# Contributor: Martin Drawitsch <mdraw.gh ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIN/

pkgname=knossos
pkgver=5.1
pkgrel=3
arch=("x86_64")
pkgdesc="A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity."
url="https://knossos.app"
license=("GPL2")
depends=("glu"
	"qt5-base"
	"qt5-python27-git" # qt5-python27
	"qt5-tools" # Qt5Help
	"quazip"
	"snappy"
)
makedepends=("boost"
	"cmake"
	"ninja"
)
optdepends=("qt5-imageformats" # Jp2
)
source=("https://github.com/knossos-project/knossos/archive/v$pkgver.tar.gz"
	"knossos.desktop"
	"GCC8-combat-K5.patch"
)
md5sums=('fd97340a07b58b3f1b1543405d893c35'
         '1a2b3733cf5fcb3e1845ce771abb58e9'
         '9e6daa1198b3f819379995d37178e3d1')

prepare() {
	cd "knossos-$pkgver"
	patch -p1 -i ../GCC8-combat-K5.patch
}

build() {
	mkdir -p "build-$CHOST-$pkgname-$pkgver"
	cd "build-$CHOST-$pkgname-$pkgver"
	cmake -G Ninja ../knossos-$pkgver
	cmake --build .
}

package() {
	install -Dm755 "build-$CHOST-$pkgname-$pkgver/knossos" "$pkgdir/usr/bin/knossos"
	install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos.png"
	install -Dm644 "knossos.desktop" "$pkgdir/usr/share/applications/knossos.desktop"
}

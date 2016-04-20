# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>
# Contributor: Martin Drawitsch <mdraw.gh ät gmail.com>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIMF/

pkgname=knossos
pkgver=4.1.2
pkgrel=7
arch=('x86_64')
pkgdesc="A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity."
url="http://www.knossostool.org/"
license=("GPL2")
depends=("curl"
	"freeglut"
	"glu"
	"glut"
	"qt5-python27"
	"quazip-qt5"
	"snappy"
)
makedepends=("boost"
	"cmake"
	"libxmu" # CMake wants libxmu for GLUT
	"ninja"
)
source=("https://github.com/knossos-project/knossos/archive/v$pkgver.tar.gz"
	"knossos.desktop"
	"quazip.patch"
)
md5sums=('c648b510bcec05a914540eea7f577bfa'
         '1a2b3733cf5fcb3e1845ce771abb58e9'
         'be06cd6e91c80b63b9bfe4184b537d7e')

prepare() {
	cd "knossos-$pkgver"
	patch -p 1 -i ../quazip.patch
}

build() {
	mkdir -p "build-$CHOST-$pkgname-$pkgver"
	cd "build-$CHOST-$pkgname-$pkgver"
	cmake -G Ninja ../knossos-$pkgver
	ninja
}

package() {
	install -Dm755 "build-$CHOST-$pkgname-$pkgver/knossos" "$pkgdir/usr/bin/knossos"
	install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos.png"
	install -Dm644 "knossos.desktop" "$pkgdir/usr/share/applications/knossos.desktop"
}

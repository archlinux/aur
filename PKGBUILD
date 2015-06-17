# Maintainer: KNOSSOS-Team <knossos-team at mpimf-heidelberg.mpg.de>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIMF/

pkgname=knossos
pkgver=4.1.2
pkgrel=2
arch=('x86_64')
pkgdesc="A software tool for the visualization and annotation of 3D image data. It was developed for the rapid reconstruction of neural morphology and connectivity."
url="http://www.knossostool.org/"
license=("GPL2")
depends=("boost"
    "glu"
    "glut"
    "libgl"
    "qt5-base"
    "qt5-python27"
    "quazip-qt5"
    "snappy"
)
makedepends=("cmake")
source=("https://github.com/knossos-project/knossos/archive/v$pkgver.tar.gz"
	"knossos.desktop"
)
md5sums=('c648b510bcec05a914540eea7f577bfa'
         '1a2b3733cf5fcb3e1845ce771abb58e9')

build() {
	mkdir -p "build-$CHOST-$pkgname-$pkgver"
	cd "build-$CHOST-$pkgname-$pkgver"
	cmake ../knossos-$pkgver
	make
}

package() {
	install -Dm755 "build-$CHOST-$pkgname-$pkgver/knossos" "$pkgdir/usr/bin/knossos"
	install -Dm644 "knossos-$pkgver/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos.png"
	install -Dm644 "knossos.desktop" "$pkgdir/usr/share/applications/knossos.desktop"
}

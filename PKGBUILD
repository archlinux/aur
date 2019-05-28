# Maintainer: KNOSSOS-Team <knossos-team ät mpimf-heidelberg.mpg.de>
#
# KNOSSOS saves its user preferences in $HOME/.config/MPIN/

pkgname=knossos-git
pkgver=5.1+466.g7614706d
pkgrel=1
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
	"git"
	"ninja"
)
optdepends=("qt5-imageformats" # Jp2
)
source=("git+https://github.com/knossos-project/knossos.git"
	"knossos-git.desktop"
)
md5sums=('SKIP'
         '85ae9c1721e627ccbe4eb850dcb7c42d')

pkgver() {
	cd "knossos"
	git describe --always --dirty --tags | sed "s/^v//;s/-/+/;s/-/./g"
}

build() {
	mkdir -p "build-$CHOST-$pkgname"
	cd "build-$CHOST-$pkgname"
	cmake -G Ninja ../knossos
	cmake --build .
}

package() {
	install -Dm755 "build-$CHOST-$pkgname/knossos" "$pkgdir/usr/bin/knossos-git"
	install -Dm644 "knossos/resources/icons/knossos.png" "$pkgdir/usr/share/pixmaps/knossos-git.png"
	install -Dm644 "knossos-git.desktop" "$pkgdir/usr/share/applications/knossos-git.desktop"
}

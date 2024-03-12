# Maintainer: Evert Vorster <superchief AT evertvorster DOT com>
pkgname=routegen-git
_pkgname=routegen
pkgver=v1.11.0_14_g4943d4e
pkgrel=1
epoch=
pkgdesc="Package for drawing and animating a route on a map"
arch=(x86_64)
url="https://github.com/michjans/routegen"
license=('GPL3')
groups=()
depends=(libgeotiff-git qt5-webchannel qt5-location qt5-declarative qt5-base qt5-webengine)



makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/michjans/routegen")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver(){
    cd "$srcdir/$_pkgname/"
    git describe --tags | tr - _
}

prepare() {
echo "Prepare step"
cd ${srcdir}
mkdir -p Build
}

build() {
echo "Build step"
cd ${srcdir}/Build
cmake ../${_pkgname}/src \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr
make
}

check() {
echo "Check routine"
}

package() {
	cd "${srcdir}/Build"
	make DESTDIR="$pkgdir/" install
}

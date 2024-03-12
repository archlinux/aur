# Maintainer: Evert Vorster <superchief AT evertvorster DOT com>
pkgname=libgeotiff-git
_pkgname=libgeotiff
pkgver=1.7.1_44_g1f3e10b
pkgrel=1
epoch=
pkgdesc="Permits the extraction of keys from geotiff files, cmake version"
arch=(x86_64)
url="https://github.com/OSGeo/libgeotiff"
license=('MIT')
groups=()
depends=(libtiff proj)
makedepends=()
checkdepends=()
optdepends=()
provides=(libgeotiff)
conflicts=(libgeotiff)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/OSGeo/libgeotiff")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver(){
    cd "$srcdir/$_pkgname/"
    git describe --tags | tr - _
}

prepare() {
echo "Prepare step"
}

build() {
echo "Build step"
cd ${srcdir}/${_pkgname}
mkdir -p build_cmake
cd build_cmake
cmake -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="-Wall -Wextra -Werror" ../libgeotiff
make -j3

}

check() {
echo "Check step"
#	cd "$pkgname-$pkgver"
#	make -k check
}

package() {
#	cd "$pkgname-$pkgver"
  cd ${srcdir}/${_pkgname}/build_cmake
  cp ../libgeotiff/LICENSE .
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

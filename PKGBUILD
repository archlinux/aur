# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=lib32-libreplaygain
_pkgname=libreplaygain
pkgver=475
pkgrel=1
pkgdesc="A library to adjust audio gain (lib32)"
arch=('x86_64')
url="http://www.musepack.net/index.php?pg=src"
license=('LGPL')
depends=('lib32-glibc')
makedepends=('cmake')
source=("http://files.musepack.net/source/${_pkgname}_r${pkgver}.tar.gz")
md5sums=('e27b3b1249b7fbae92d656d9e3d26633')

build() {
cd "${srcdir}"
mkdir build
cd build
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

cmake ../${_pkgname}_r${pkgver}/ \
  -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release
make
}

package() {
cd "${srcdir}"/build
make DESTDIR="${pkgdir}" install
install -d "${pkgdir}"/usr/include/replaygain/
install -Dm644 "${srcdir}"/${_pkgname}_r${pkgver}/include/replaygain/* \
  "${pkgdir}"/usr/include/replaygain/

cd "$pkgdir/usr"
rm -rf {bin,include,share/imlib2}/
mv lib/ lib32/

}

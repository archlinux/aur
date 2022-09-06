# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor Beini <bane AT iki dot fi>

pkgname=jk2mv
pkgver=1.4.1
pkgrel=1
pkgdesc="Modification for Jedi Knight II: Jedi Outcast."
arch=('i686' 'x86_64')
url="https://jk2mv.org"
license=('GPL')
depends=(
    'hicolor-icon-theme'
    'libgl'
    'libjpeg'
    'libpng'
    'minizip'
    'openal'
    'sdl2'
    'zlib'
)
makedepends=(
    'cmake'
    'yasm'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/mvdevs/$pkgname/archive/$pkgver.tar.gz"
    "jk2mv.install"
)
install=jk2mv.install
b2sums=('135363e50e4a062ebf7cb6516acd84c37eb70ff6d24c2ba6ea8ad9053bf42ca93951984c6180dbd8bbc7f69fc40275f47da41f27a6f90fe7f5dd65110b61a62b'
        '7ddf6479f7d1d3f56f2946ec83062d2bcf41bb77219ad59da2888c95a670865b35545b7d1fa9e2a11ee0ec1ddf46d94e22378760c53093f214776d8e21592c54')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    cd build
    cmake -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DUseInternalPNG=OFF \
        -DUseInternalJPEG=OFF \
        -DUseInternalZLIB=OFF \
        -DBuildPortableVersion=OFF \
        ..
    make
}

package() {
    cd "${srcdir}/$pkgname-$pkgver/build/"
    make DESTDIR="${pkgdir}" install
}

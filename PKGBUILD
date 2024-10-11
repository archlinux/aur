# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='qt5-advanced-docking-system'
pkgver='4.3.1'
pkgrel=1
pkgdesc='Qt advanced docking widgets'
arch=('x86_64')
url='https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System/'
license=('LGPL-2.1-only')
makedepends=('cmake' 'ninja' 'gcc')
depends=('qt5-base' 'glibc' 'gcc-libs' 'libxcb')

_orgpkgname='Qt-Advanced-Docking-System'
_pkgbuilddir="$_orgpkgname-$pkgver/build"
_pkgsrcdir="$_orgpkgname-$pkgver"

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/githubuser0xFFFF/${_orgpkgname}/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    'ee78b1c7f6164b06ce9c193aa5dfa19281a1c894cd8a8cbcae6d137abc13417f32e0f2a05f9d91557e14ced91b3b541991065d0ee190ea5ad2623c3848674eaf'
)

build() {
    cmake "$_pkgsrcdir" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$_pkgbuilddir" -G"Ninja" -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_EXAMPLES=OFF -DADS_VERSION="$pkgver" -DQT_VERSION_MAJOR="5"
    cmake --build "$_pkgbuilddir"
}

package() {
    cmake --install "$_pkgbuilddir"
    mkdir -p "$pkgdir/usr/share/licenses/qt-advanced-docking-system"
    mv "$pkgdir/usr/license/ads/LICENSE" "$pkgdir/usr/share/licenses/qt-advanced-docking-system"
    mv "$pkgdir/usr/license/ads/gnu-lgpl-v2.1.md" "$pkgdir/usr/share/licenses/qt-advanced-docking-system"
    rm -rf "$pkgdir/usr/license"
}

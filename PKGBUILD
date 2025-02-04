# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='qt5-advanced-docking-system'
pkgver='4.4.0'
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
    '57ffa7280741744edeb5c808589b9724c6b074d0e9031ae2e2ae6ccc404f11a35a2201baf16c4bfc9ee04d0c971e0c60d00bf7712bd7335aa41e1da5b97d272a'
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

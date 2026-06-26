# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='qt5-advanced-docking-system'
pkgver='5.0.0'
pkgrel=1
pkgdesc='Qt advanced docking widgets'
arch=('x86_64')
url='https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System/'
license=('LGPL-2.1-only')
makedepends=('cmake' 'ninja' 'gcc')
depends=('qt5-base' 'glibc' 'libxcb')

_orgpkgname='Qt-Advanced-Docking-System'
_pkgbuilddir="$_orgpkgname-$pkgver/build"
_pkgsrcdir="$_orgpkgname-$pkgver"

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/githubuser0xFFFF/${_orgpkgname}/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    'f858926b60edb865ad86f9b4874279d703bc604dd52c8bda39768c0a0a3441133aacc2b560b9604aca4cc1b016c66927ef390ae2edb86ac82bc3410d9ed1b3ee'
)

options=('!debug')

build() {
    cmake "$_pkgsrcdir" -DCMAKE_INSTALL_PREFIX=/usr -B"$_pkgbuilddir" -G"Ninja" -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_EXAMPLES=OFF -DADS_VERSION="$pkgver" -DQT_VERSION_MAJOR="5"
    cmake --build "$_pkgbuilddir"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$_pkgbuilddir"
    mkdir -p "$pkgdir/usr/share/licenses/qt5-advanced-docking-system"
    mv "$pkgdir/usr/share/ads/license/LICENSE" "$pkgdir/usr/share/licenses/qt5-advanced-docking-system"
    mv "$pkgdir/usr/share/ads/license/gnu-lgpl-v2.1.md" "$pkgdir/usr/share/licenses/qt5-advanced-docking-system"
    rm -rf "$pkgdir/usr/share/ads"
}

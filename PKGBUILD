# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='qt5-advanced-docking-system'
pkgver='5.1.1'
pkgrel=1
pkgdesc='Qt advanced docking widgets'
arch=('x86_64')
url='https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System/'
license=('LGPL-2.1-only')
makedepends=('cmake' 'ninja' 'gcc')
depends=('qt5-base' 'glibc' 'libxcb' 'libstdc++' 'libgcc')

_orgpkgname='Qt-Advanced-Docking-System'
_pkgbuilddir="$_orgpkgname-$pkgver/build"
_pkgsrcdir="$_orgpkgname-$pkgver"

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/githubuser0xFFFF/${_orgpkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
    'a2b4ad4887733b3126e4a5f3c9973e058e0a7f408f213dd24e3c55e90258b28ec448d6af0602d397e6c16cabe402f436ae33c96b93f5504db5fa7802359263f4'
)

options=('!debug')

build() {
    cmake "$_pkgsrcdir" -DCMAKE_INSTALL_PREFIX=/usr -B"$_pkgbuilddir" -G"Ninja" -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_EXAMPLES=OFF -DQT_VERSION_MAJOR="5"
    cmake --build "$_pkgbuilddir"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$_pkgbuilddir"
    mkdir -p "$pkgdir/usr/share/licenses/qt5-advanced-docking-system"
    mv "$pkgdir/usr/share/ads/license/LICENSE" "$pkgdir/usr/share/licenses/qt5-advanced-docking-system"
    mv "$pkgdir/usr/share/ads/license/gnu-lgpl-v2.1.md" "$pkgdir/usr/share/licenses/qt5-advanced-docking-system"
    rm -rf "$pkgdir/usr/share/ads"
}

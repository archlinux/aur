pkgname=linver
pkgver=1.0.0
pkgrel=1
pkgdesc="winver, but for Linux"
arch=('x86_64')
url="https://github.com/itsflameee/linver"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('cmake' 'ninja')
provides=('linver')
conflicts=('linver-bin' 'linver-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f0cf631bc87270f2803b2339eb84ef147fa98b54cb089ca2e41334b5b16b4ba2')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

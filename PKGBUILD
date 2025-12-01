# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-wallpapers
pkgver=1.0
pkgrel=3
pkgdesc="CutefishOS's system wallpaper"
arch=('any')
url="https://github.com/cutefishos/wallpapers"
license=('LicenseRef-Unsplash')
groups=('cutefish')
depends=()
makedepends=('cmake' 'ninja')
source=("https://github.com/cutefishos/wallpapers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ea4d4d236b62993d2f5e3fb057fee50928318445da6e645703d637492fde0393c398d31aaed23d7274a88846452190c2b55868561e5c674520238033b77d1804')

build() {
  cmake -G Ninja -B build -S wallpapers-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" wallpapers-$pkgver/LICENSE
}

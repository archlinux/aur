# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-dock
pkgver=0.8
pkgrel=3
pkgdesc="CutefishOS application dock"
arch=('x86_64')
url="https://github.com/cutefishos/dock"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/dock/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        fix-build.patch)
sha512sums=('98d97abcbc82afd31e13fff3f76bc81f12ba2ab2c1fdcec3c0c800d1945d9353bb7d7086d3d79ae0edc397db025a76afcd7e09e2e68ab60f07770bd3931515d7'
            'a44cb33d8f2f40a3e8f20464578b59c8405851668ce1f1d32f3503e7e6ba984ec8ecef4021393593ce68988b355c7fda7ec9c65f582e76ce74715db49d6d3cc9')

prepare() {
  cd dock-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch
}

build() {
  cmake -G Ninja -B build -S dock-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

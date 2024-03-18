# Maintainer: Mihkel Tõnnov <mihhkel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=taglib-extras
pkgver=1.0.1
pkgrel=8
pkgdesc="Additional taglib plugins"
arch=('x86_64' 'aarch64')
url="https://developer.kde.org/~wheeler/taglib.html"
license=('LGPL')
depends=('taglib>=2.0')
makedepends=('cmake')
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.gz" taglib-2.0.diff)
sha256sums=('fe546b4b315f3227c975fed8ea9dfc0e54fc6997fdbba2a9da7beba479229632'
            'ca199ed8a7084b948f5f3fa6c7f4763a22d5e7b587cfa596f0b26d61a6f88792')

prepare() {
  [[ -d build ]] || mkdir -p build

  # Fix build with TagLib 2
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir"/taglib-2.0.diff
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

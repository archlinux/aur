# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=plasma-potd-spotlight
pkgver=1.0.1
pkgrel=1
pkgdesc="A POTD data engine for plasma that fetches high resolution wallpapers from Microsoft Spotlight"
url="https://github.com/Aetf/$pkgname"
arch=('i686' 'x86_64')
license=("BSD")
depends=("kdeplasma-addons")
makedepends=('git' 'extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aetf/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p build
}

build() {
  cd $srcdir/$pkgname-$pkgver/build

  cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_LIBEXECDIR=lib \
      -DWITH_TESTS=Off \
      ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: esroyo <esroyo@gmail.com>
# Contributor: Olivier Brunel <jjk@jjacky.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=fpm2
pkgver=0.90.2
pkgrel=2
pkgdesc="Figaro's Password Manager 2"
arch=('i686' 'x86_64')
url="http://als.regnet.cz/fpm2/"
license=('GPL')
depends=('gtk3')
makedepends=('meson' 'pkgconf>=1.0')
source=(https://als.regnet.cz/$pkgname/download/$pkgname-$pkgver.tar.xz
        fix-nettle-digest.patch)
sha256sums=('85b2a996bdbf65028b92a8c1d7ceed62787560562344a3f66397e7cd85d72030'
            '913dde987f4e7ef924a396b5801723eccf87c2c788a71c913391b51075ae76a6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fix-nettle-digest.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

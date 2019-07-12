# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=caire
pkgver=1.2.2
pkgrel=1
pkgdesc="Content aware image resize library based on Seam Carving"
arch=('x86_64' 'i686')
url="https://github.com/esimov/caire"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/esimov/$pkgname/archive/v$pkgver.tar.gz" a72687f032cd5ed4ce3dfe34b21002b4d5ae2964.patch)
makedepends=('go')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/a72687f032cd5ed4ce3dfe34b21002b4d5ae2964.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./build.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('5cd2b48b4b89d5c696977860cd1597cac65ea9b04243f8a015ce37c9835c5646'
            '5f5df4fd3d287285d2e5beef17fc2946c205335e3b93dd32c5d8c12711584ecc')

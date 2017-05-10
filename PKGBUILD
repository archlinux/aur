# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=guile-commonmark
pkgver=0.1
pkgrel=1
pkgdesc="Guile library for parsing CommonMark"
arch=('any')
url="https://github.com/OrangeShark/guile-commonmark"
license=('LGPL3')
depends=('guile')
source=("https://github.com/OrangeShark/guile-commonmark/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "fix-guile-version.patch")
sha512sums=('cacb58392b0c5bc69e06da04b2f1d8ea7d6e8a06f1d76a92a7a6fbd97279a234ba435f065ee928343f96bdce5becf61d503a3d1a674a61d3a3d2d86f951f6f38'
            'b43dacc6c0c0953c1c98ed9e2a5f17b0b9f45d325a55db9bc050f9c4e46cd2f75936a38b8e194cb6b4689eaa5316d720134ae5a0d799c26326188e38849fd7bb')

prepare() {
  cd "$pkgname"-"$pkgver"
  patch -p1 -i "$srcdir"/fix-guile-version.patch
}

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}

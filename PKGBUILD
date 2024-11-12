# Maintainer: Patrick McCarty <pnorcks at gmail.com>
# Contributor: Florian Pelz <pelzflorian at pelzflorian.de>

pkgname=guile-commonmark
pkgver=0.1.2
pkgrel=2
pkgdesc="Guile library for parsing CommonMark"
arch=('any')
url="https://github.com/OrangeShark/guile-commonmark"
license=('LGPL-3.0-or-later')
depends=('guile')
source=("https://github.com/OrangeShark/guile-commonmark/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	guile-3.patch)
sha512sums=('a2ed34bb4bc5d7b33875beff7eb959c0119fa62950c8f9de2c5c59ef85301e47354af3d2b38990802389e6b9c94653b927d380c6918feaeb82099ad92a91bf07'
            '10e422d96a00b37dc1f59b8635118fed4def2055ebcec63727d7c0aa5c9919a5a71c0ca6ef252f79439e2539e6462421252f31ce9ce52c249e3c7cab3e20ecaa')

prepare() {
  cd "$pkgname"-"$pkgver"
  patch -p1 -i "$srcdir"/guile-3.patch
}

build() {
  cd "$pkgname"-"$pkgver"
  autoreconf -fi
  ./configure --prefix=/usr --enable-silent-rules
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

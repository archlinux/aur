# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Humbert Julien <julroy67 [AT] gmail.com>

pkgname=zinnia
pkgver=0.06
pkgrel=6
pkgdesc="Simple, customizable and portable online hand recognition system based on Support Vector Machines"
arch=('x86_64')
url="http://zinnia.sourceforge.net/"
license=('BSD')
depends=('gcc-libs')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        zinnia-gcc6.patch)
sha256sums=('ece3af93f937282971634fd81d3e997f848e8cfa958220e26a4564ca064ac20b'
            'f27cc4bd687d4c66525f744315c53caa537f1998dd546ffba9ef337e033854e6')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../zinnia-gcc6.patch # Fix build with GCC 6 (Debian)
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

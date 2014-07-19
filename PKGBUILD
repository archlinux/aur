# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=enventor
pkgver=0.3.0
pkgrel=1
pkgdesc="Editor for EDC files (edje/efl)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary')
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b1fb7c979d80e93183c023af9236f7d188ae75e387e710741814c769b5d774b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}

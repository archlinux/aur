# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Bartlomiej Piotrowski <nospam at bpiotrowski dot pl>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=discount
pkgver=2.1.8
pkgrel=1
pkgdesc="A Markdown implementation written in C"
arch=('i686' 'x86_64')
url="http://www.pell.portland.or.us/~orc/Code/discount/"
license=('custom:BSD')
provides=('markdown')
conflicts=('markdown')
source=("https://github.com/Orc/${pkgname}/archive/v$pkgver.tar.gz"
        "no-ldconfig.patch")
sha256sums=('f22f27305d24d583f8a791b8f92f834b8b9da3e34a867418c0ae0fb5c4947adf'
            '1c29658836b3a18b63e8ba3d82e93bb64ebe7142e3f55a33f52bc2c279531633')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e "s/m 444/m 644/g" -i configure.inc
  patch -p1 -i "$srcdir/no-ldconfig.patch"
  ./configure.sh --prefix=/usr --enable-all-features --with-fenced-code --shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,include,lib}
  make DESTDIR="$pkgdir" install.everything
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

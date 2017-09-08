# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Bartlomiej Piotrowski <nospam at bpiotrowski dot pl>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=discount
pkgver=2.2.2
pkgrel=2
pkgdesc="A Markdown implementation written in C"
arch=('i686' 'x86_64')
url="https://www.pell.portland.or.us/~orc/Code/discount/"
license=('custom:BSD')
provides=('markdown')
conflicts=('markdown')
source=("http://www.pell.portland.or.us/~orc/Code/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ec7916731e3ef8516336333f8b7aa9e2af51e57c0017b1e03fa43f1ba6978f64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/m 444/m 644/g' -i configure.inc
  sed -e '/test.*librarian.sh/d' -i configure.inc
  ./configure.sh --prefix=/usr --enable-all-features --with-fenced-code --shared --pkg-config
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,include,lib}
  make DESTDIR="$pkgdir" install.everything
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

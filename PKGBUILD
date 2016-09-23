# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Bartlomiej Piotrowski <nospam at bpiotrowski dot pl>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=discount
pkgver=2.2.1
pkgrel=1
pkgdesc="A Markdown implementation written in C"
arch=('i686' 'x86_64')
url="https://www.pell.portland.or.us/~orc/Code/discount/"
license=('custom:BSD')
provides=('markdown')
conflicts=('markdown')
source=("http://www.pell.portland.or.us/~orc/Code/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('88458c7c2cfc870f8e6cf42b300408c112e05a45c88f8af35abb33de0e96fe0e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/m 444/m 644/g' -i configure.inc
  sed '1347d' -i configure.inc
  ./configure.sh --prefix=/usr --enable-all-features --with-fenced-code --shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,include,lib}
  make DESTDIR="$pkgdir" install.everything
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

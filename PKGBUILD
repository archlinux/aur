# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Bartlomiej Piotrowski <nospam at bpiotrowski dot pl>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=discount
pkgver=2.1.7
pkgrel=2
pkgdesc="A Markdown implementation written in C"
arch=('i686' 'x86_64')
url="http://www.pell.portland.or.us/~orc/Code/discount/"
license=('custom:BSD')
provides=('markdown')
conflicts=('markdown')
source=("https://github.com/Orc/${pkgname}/archive/v$pkgver.tar.gz"
        "no-ldconfig.patch")
md5sums=('bc60abde3d36fe891802c59544591d63'
         '744609beab58d358a2109e622927f379')

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

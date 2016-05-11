# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Bartlomiej Piotrowski <nospam at bpiotrowski dot pl>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=discount
pkgver=2.2.0
pkgrel=1
pkgdesc="A Markdown implementation written in C"
arch=('i686' 'x86_64')
url="https://www.pell.portland.or.us/~orc/Code/discount/"
license=('custom:BSD')
provides=('markdown')
conflicts=('markdown')
source=("http://www.pell.portland.or.us/~orc/Code/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "no-ldconfig.patch")
sha256sums=('b25395c29c2c08836199eb2eae87b56e6b545e77f5fbf921678aa1dc0ddab9f3'
            'f8f2d473d566973d3a99f52d85631a6ad0561a0f71ce4a35e0fa89dd4478c360')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/m 444/m 644/g' -i configure.inc
  sed '1335d' -i configure.inc
  ./configure.sh --prefix=/usr --enable-all-features --with-fenced-code --shared
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,include,lib}
  make DESTDIR="$pkgdir" install.everything
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

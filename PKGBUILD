# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=potool-renamed
pkgver=0.19
pkgrel=1
pkgdesc="Program to help editing po files, without poedit name clash"
arch=('i686' 'x86_64')
url="https://marcin.owsiany.pl/potool-page"
license=('GPL')
depends=('perl' 'glib2')
provides=('potool')
conflicts=('potool')
source=("https://marcin.owsiany.pl/potool/potool-${pkgver}.tar.gz"
        'poedit-rename.patch'
        'poedit-test.patch')
sha256sums=('1251621b5e69b660987e8c9497df9e75e0b3e40bcf8304bdbd26a4fbd37c4384'
            'b331dde0a64ddac275ce607fe6fff8517b692bb186e2c0ea6ff907acbcb604be'
            'fed991e63843b265da85708bc3ce75329e5ead0193e73d0527961122bcd43b3b')

prepare() {
  cd potool-"$pkgver"
  mv scripts/poedit scripts/potooledit
  patch -i "$srcdir"/poedit-rename.patch
  patch -p0 -i "$srcdir"/poedit-test.patch
}

build() {
  cd potool-"$pkgver"
  make
}

check() {
  cd potool-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/potool-"$pkgver"
  make DESTDIR="$pkgdir/usr" install
  install -Dm644 change-po-charset.1 "$pkgdir"/usr/share/man/man1/change-po-charset.1
  install -Dm644 change-po-charset.pl.1 "$pkgdir"/usr/share/man/pl/man1/change-po-charset.1
  install -Dm644 poedit.1 "$pkgdir"/usr/share/man/man1/potooledit.1
  install -Dm644 poedit.pl.1 "$pkgdir"/usr/share/man/pl/man1/potooledit.1
  install -Dm644 postats.1 "$pkgdir"/usr/share/man/man1/postats.1
  install -Dm644 postats.pl.1 "$pkgdir"/usr/share/man/pl/man1/postats.1
  install -Dm644 potool.1 "$pkgdir"/usr/share/man/man1/potool.1
  install -Dm644 potool.pl.1 "$pkgdir"/usr/share/man/pl/man1/potool.1
}

# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: juergen <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=text2pdf
pkgver=1.1
pkgrel=6
_commit=3f6d725379337d0b9bde2e5e350fdfc249216be7
pkgdesc='Convert text files to PDF'
arch=('i686' 'x86_64')
url='http://www.eprg.org/pdfcorner/text2pdf/'
license=('custom')
depends=('glibc')
conflicts=('pdflib-lite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/philips/text2pdf/archive/$_commit.tar.gz")
sha256sums=('83159d607ede9164dc47d64e04589a43c3b7b71d4c0ef61e114f22b132897727')

prepare() {
  cd $pkgname-$_commit
  head -n 24 text2pdf.c > LICENSE
}

build() {
  cd $pkgname-$_commit
  gcc $CPPFLAGS $CFLAGS -o text2pdf text2pdf.c $LDFLAGS
}

package() {
  cd $pkgname-$_commit
  install -Dm755 text2pdf "$pkgdir"/usr/bin/text2pdf
  install -Dm644 text2pdf.1 "$pkgdir"/usr/share/man/man1/text2pdf.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

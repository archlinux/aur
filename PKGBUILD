# Maintainer:
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor:: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Xilon <xilonmu@gmail.com>

pkgname=catdvi
pkgver=0.14
pkgrel=8
pkgdesc="A DVI to plain text translator"
arch=('x86_64')
url="http://catdvi.sourceforge.net"
license=('GPL')
depends=('glibc' 'texlive-core')
makedepends=('texlive-fontsextra')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        'texlive2008.patch')
md5sums=('b18eac65baf522c1e37bb3dc37ab42c3'
         '509f61a30d3758e5d102c124bc5fa9a0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "${srcdir}"/texlive2008.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoconf
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
  make DESTDIR="$pkgdir" install bindir="$pkgdir"/usr/bin mandir="$pkgdir"/usr/share/man
}

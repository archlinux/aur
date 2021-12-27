# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Paulius Palevicius <paulius@birzai.com>

pkgname=libgnomecups
pkgver=0.2.3
pkgrel=16
pkgdesc='GNOME CUPS library'
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')
url='http://www.gnome.org/'
depends=('libcups')
makedepends=('perl-xml-parser')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.2/$pkgname-$pkgver.tar.bz2"
        'libgnomecups_0.2.3-ignore-ipp-not-found.patch'
        'gentoo1.patch'
        'gentoo2.patch')

prepare() {
  cd "$pkgname-$pkgver"

  # This avoids generating huge 'IPP request failed with status 1030' lines
  patch -Np1 -i "$srcdir/libgnomecups_0.2.3-ignore-ipp-not-found.patch"

  # Gentoo seems to have taken over the development
  patch -Np1 -i "$srcdir/gentoo1.patch"
  patch -Np1 -i "$srcdir/gentoo2.patch"
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  export CFLAGS="$CFLAGS -w"
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
md5sums=('dc4920c15c9f886f73ea74fbff0ae48b'
         '973a1b9d93013ce431400a14b78f5d94'
         'de094a91df09f2136f13e5380b9bfa84'
         'b9e1d6a5eda9ecb98a1fcb6f8d0e9b4d')
sha256sums=('e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29'
            '2cb96c758245e863e29bbb097314c94897a45320334b93a874eb095f4c3af8fd'
            '647f51deae54fbca376ad9febdb9047d4bc4f1f80be76abc671297e76176c3f5'
            'edda0fcf15ac772a5553367221d2761d6867f7292bc6c6ad03c9772f56dede1e')

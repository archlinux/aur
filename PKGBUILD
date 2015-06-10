# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Paulius Palevicius <paulius@birzai.com>

pkgname=libgnomecups
pkgver=0.2.3
pkgrel=13
pkgdesc='GNOME CUPS library'
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')
url='http://www.gnome.org/'
depends=('libcups')
makedepends=('perl-xml-parser')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.2/$pkgname-$pkgver.tar.bz2"
        'libgnomecups_0.2.3-ignore-ipp-not-found.patch'
        'gentoo1.patch::http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-print/libgnomecups/files/libgnomecups-0.2.3-glib.h.patch?revision=1.1'
        'gentoo2.patch::http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-print/libgnomecups/files/libgnomecups-0.2.3-cups-1.6.patch?revision=1.1')
md5sums=('dc4920c15c9f886f73ea74fbff0ae48b'
         '973a1b9d93013ce431400a14b78f5d94'
         'de094a91df09f2136f13e5380b9bfa84'
         'b9e1d6a5eda9ecb98a1fcb6f8d0e9b4d')

build() {
  cd "$pkgname-$pkgver"

  # This avoids generating huge 'IPP request failed with status 1030' lines
  patch -Np1 -i "$srcdir/libgnomecups_0.2.3-ignore-ipp-not-found.patch"

  # Gentoo seems to have taken over the development
  patch -Np1 -i "$srcdir/gentoo1.patch"
  patch -Np1 -i "$srcdir/gentoo2.patch"

  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

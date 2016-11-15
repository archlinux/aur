# Maintainer: Paul Clark <paul500clark@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Israel Herraiz <isra@herraiz.org>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=mpop-gnome
pkgver=1.2.6
pkgrel=1
pkgdesc="A small, fast POP3 client suitable as a fetchmail replacement with GNOME keyring support"
arch=('i686' 'x86_64')
url="http://mpop.sourceforge.net/"
license=('GPL3')
depends=('gnutls' 'libidn' 'libsecret')
provides=('mpop')
conflicts=('mpop')
replaces=('mpop')
install=$pkgname.install
source=("http://downloads.sourceforge.net/mpop/mpop-$pkgver.tar.xz"{,.sig})
md5sums=('2298ddcf1defbf8e7097a1869c8d39d3'
         'SKIP')
validpgpkeys=('2F788CDEF4181652720EF132F4926138953E5294')

build() {
  cd "$srcdir/mpop-$pkgver"

  ./configure --prefix=/usr --with-ssl=gnutls --with-libsecret
  make
}

package() {
  cd "$srcdir/mpop-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 doc/mpoprc.example "$pkgdir/usr/share/mpop/mpoprc.example"
}

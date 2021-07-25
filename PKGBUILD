# Maintainer: osily <ly50247 at gmail dot com>
# Contributor: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=gqview-devel
_pkgname=gqview
pkgver=2.1.5
pkgrel=9
pkgdesc="An image browser and viewer"
arch=('i686' 'x86_64')
url="http://gqview.sourceforge.net/"
license=('GPL')
depends=('gtk2')
conflicts=('gqview')
provides=('gqview')
source=(http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('12fea494e607a69eff31cdca13d306ef1b0b3b7850be0f8b236f267d8f2e9546')

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver"
  sed -i 's+.png++' gqview.desktop
  sed -i 's+image;++' gqview.desktop
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  CPPFLAGS="-D_FILE_OFFSET_BITS=64" LDFLAGS+=" -lm" CC=clang ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 gqview.1 "$pkgdir"/usr/share/man/man1/$pkgname.1.gz
  rm -rf "$pkgdir"/usr/man
}

# Maintainer: osily <ly50247 at gmail dot com>
# Contributor: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=gqview-devel
_pkgname=gqview
pkgver=2.1.5
pkgrel=6
pkgdesc="An image browser and viewer"
arch=('i686' 'x86_64')
url="http://gqview.sourceforge.net/"
license=('GPL')
depends=('gtk2')
conflicts=('gqview')
provides=('gqview')
source=(http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('4644187d9b14b1dc11ac3bb146f262ea')

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver"
  sed -i 's+.png++' gqview.desktop
  sed -i 's+image;++' gqview.desktop
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  ./configure LDFLAGS="-lm" --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
}

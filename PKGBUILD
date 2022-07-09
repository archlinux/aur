# Maintainer: budRich <at budlabs>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=galculator-gtk2
_pkgname=galculator
pkgver=2.1.4
pkgrel=6
pkgdesc='GTK+ based scientific calculator'
arch=('x86_64')
url='http://galculator.sourceforge.net/'
license=('GPL')
depends=('gtk2')
makedepends=('intltool')
provides=(galculator)
conflicts=(galculator)
source=("http://galculator.mnim.org/downloads/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('01cfafe6606e7ec45facb708ef85efd6c1e8bb41001a999d28212a825ef778ae')

build() {
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-gtk3
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

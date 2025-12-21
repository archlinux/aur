# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mahmud Ridwan <m[at]hjr265[dot]me>

pkgname=ibus-avro-git
epoch=1
pkgver=1.2.r6.g8862f77
pkgrel=2
pkgdesc="Avro Phonetic Bangla typing for Linux"
url="http://linux.omicronlab.com"
arch=(any)
license=(MPL-2.0)
depends=(ibus gjs)
makedepends=(git)
provides=(ibus-avro)
conflicts=(ibus-avro)
source=("git+https://github.com/sarim/ibus-avro")
sha256sums=('SKIP')

pkgver() {
  cd ibus-avro
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ibus-avro
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd ibus-avro
  ./configure --prefix=/usr
  make
}

package() {
  cd ibus-avro
  make DESTDIR="$pkgdir" installdeb
  rmdir "$pkgdir/usr/libexec"
  sed -i 's|<layout>bn</layout>|<layout>us</layout>|' "$pkgdir/usr/share/ibus/component/ibus-avro.xml"
}

# Maintainer: Tasin Farhan <tasinfarhan1016@gmail.com> -> https://github.com/TasinFarhanMC
# Contributor: Mahmud Ridwan <m[at]hjr265[dot]me>

pkgname=ibus-avro
pkgver=1.2
pkgrel=1
pkgdesc="Avro Phonetic Bangla typing for Linux"
url="http://linux.omicronlab.com"
provides=('ibus-avro' 'ibus-avro-alt')
conflicts=('ibus-avro-git')
arch=('any')
license=('MPL')
depends=('ibus' 'gjs')
makedepends=('autoconf' 'automake' 'git')
source=("https://github.com/sarim/ibus-avro/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9d00f12f2d01916e56533fd0267173b644a57161770b60a0f4d9daa61fe8bd1a')

prepare() {
  cd "ibus-avro-${pkgver}"
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd "ibus-avro-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "ibus-avro-${pkgver}"
  make DESTDIR="$pkgdir" installdeb
  rmdir "$pkgdir/usr/libexec"
  sed -i 's|<layout>bn</layout>|<layout>us</layout>|' "$pkgdir/usr/share/ibus/component/ibus-avro.xml"
}

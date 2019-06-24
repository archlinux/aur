# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mahmud Ridwan <m[at]hjr265[dot]me>

pkgname=ibus-avro-git
epoch=1
pkgver=1.0.r8.gfe50959
pkgrel=1
pkgdesc="Avro Phonetic Bangla typing for Linux"
url="http://linux.omicronlab.com"
arch=(any)
license=(MPL)
depends=(ibus gjs)
makedepends=(git autoconf automake)
source=("git+https://github.com/sarim/ibus-avro")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" installdeb
  rmdir "$pkgdir/usr/libexec"
  sed -i 's|<layout>bn</layout>|<layout>us</layout>|' "$pkgdir/usr/share/ibus/component/ibus-avro.xml"
}

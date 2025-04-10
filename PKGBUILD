# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=lisaem
pkgver=RC5_2025.03.15
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Apple Lisa computer emulator"
arch=('x86_64')
url="https://github.com/arcanebyte/lisaem"
license=('GPL-2.0-or-later')
depends=('wxwidgets-gtk3')
makedepends=('git')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/$_pkgver.tar.gz")
b2sums=('594922cd9f24e36b45d8bf962143701c38f97ca472de2c92eac426cf3a80e9088ccec686c6097d8139d3cc156f84f3e8e1f4951d9f73fe72623c7910cab2aed8')

prepare() {
  cd $pkgname-$_pkgver
  sed -i "s|usr/local|usr|g" bashbuild/Linux.sys resources/lisaem.desktop
  sed -i "s/egrep/grep -E/g" build.sh bashbuild/src.build bashbuild/compilequeue.fn bashbuild/pre-atexit.fn
}

build() {
  cd $pkgname-$_pkgver
  ./build.sh clean build
}

package() {
  cd $pkgname-$_pkgver
  sed -i "s|\"/usr|\"$pkgdir/usr|g" bashbuild/Linux.sys
  ./build.sh install

  install -Dm644 "$srcdir/$pkgname-$_pkgver/LICENSE.txt" \
                 "$pkgdir/usr/share/doc/$pkgname/LICENSE.txt"
}

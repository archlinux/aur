# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.11.0
pkgrel=1
pkgdesc="build2 build system"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
makedepends=(wget)
source=("https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz")
sha256sums=('653bb75f31ca05760eba62bb6727d11a9f0d8ce4aa2fc1fb996d7ef6e76a4938')

build() {
  cd build2-toolchain-$pkgver
  mkdir -p install
  ./build.sh --trust yes --install-dir `pwd`/install g++
}

package() {
  cd build2-toolchain-$pkgver
  mkdir -p "$pkgdir/usr/bin"
  cp install/bin/* "$pkgdir/usr/bin/"
  mkdir -p "$pkdir/usr/share"
  cp -R install/share/ "$pkgdir/usr/share/"
  mkdir -p "$pkdir/usr/lib"
  cp -R install/lib/ "$pkgdir/usr/lib/"
  rm $pkgdir/usr/lib/{libsqlite3.so,libpkgconf.so}
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 ./build2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=tqsl
pkgver=2.8.2
pkgrel=1
pkgdesc='ARRL LoTW Trusted QSL (TQSL) software'
url='https://www.arrl.org/tqsl-download'
arch=('x86_64')
license=('custom')
depends=('openssl' 'sqlite' 'expat' 'zlib' 'curl' 'wxwidgets-gtk3')
makedepends=('cmake')
source=("https://www.arrl.org/tqsl/tqsl-$pkgver.tar.gz")
sha512sums=('853763110ca4ec3ffd5e3cbd3e3be264acf772a88e977db6fa8ad02a86dac85e70193edfc6f89c690cd8959bc6c1fc31ad400ecbae83ca039cb751a7750501d8')

build() {
  cd $pkgname-$pkgver

  cmake -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_ALL_EXTRAPROGS=true

  cmake --build build
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

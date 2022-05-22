# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20220506
pkgrel=1
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('libxv' 'sdl12-compat')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('8dacd1fd719c20fdc8ef157d1487202a39d4f36a37560ad62680655addde0ceb78bbce51e4f640d3979c91f6a4dfe4bc006785aa35d45a00206773d41adf9f42')

prepare() {
  # Change SDL version check (make compatible with "sdl12-compat" package)
  sed -i "s/1.2.1/1.2.5/" \
         "$srcdir/$pkgname-$pkgver/configure.ac"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 README.md \
                 "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 COPYING \
                 "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

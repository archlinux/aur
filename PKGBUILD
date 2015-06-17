pkgname=atf
pkgver=0.21
pkgrel=1
pkgdesc="Automated Testing Framework"
arch=(i686 x86_64)
url='https://github.com/jmmv/atf/'
depends=(gcc-libs)
license=(BSD)
source=(https://github.com/jmmv/atf/archive/atf-$pkgver.zip)
sha1sums=('743a0a5fda87470330e7dffcd2436f39285a1f95')

build() {
  cd atf-atf-$pkgver
  autoreconf -i -s
  ./configure --prefix=/usr --libexecdir=/usr/bin --disable-developer
  make
}

check() {
  cd atf-atf-$pkgver
  make check
}

package() {
  cd atf-atf-$pkgver
  make install DESTDIR="$pkgdir"
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

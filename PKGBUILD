pkgname=atf
pkgver=0.21
pkgrel=1
pkgdesc="Automated Testing Framework"
arch=(i686 x86_64)
url='https://github.com/jmmv/atf/'
depends=(gcc-libs)
license=(BSD)
source=(https://github.com/jmmv/atf/archive/atf-$pkgver.zip)
sha1sums=('986f7e13eb8f3ffdba6bd210c39816734589bfb9')

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

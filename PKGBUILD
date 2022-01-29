# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20220125
pkgrel=1
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('libxv' 'sdl')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('c34979cf6cda75a4e5533631b8134b2994a5491f1182b69bfa6e1c97fd2f2e0dc90d883c6184fb24e68e60351e91ca1a2bcccb3708fc0099d0051452b5a44851')

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

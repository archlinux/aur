# Maintainer: Tercio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Brandon Mulcahy <brandon@jangler.info>

pkgname=schismtracker
pkgver=20220807
pkgrel=1
pkgdesc='An oldschool sample-based music composition tool'
arch=('i686' 'pentium4' 'x86_64' 'armv7h')  # and probably other ARMs
url='http://schismtracker.org/'
license=('GPL')
depends=('libxv' 'sdl2')
makedepends=('python')
conflicts=('schismtracker-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('36944581ef88ba256764d1acec0f6d38fb83027ebca7bfea7d313693d9e4062bd217ba6c4dee6a262753b186398b89035d371c5428b35c33eaf95e901bd7304d')

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
}

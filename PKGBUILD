# Maintainer: Dylan Forbes <dylandforbes@gmail.com>
pkgname='rcm-fast'
pkgver=2.0.0
pkgrel=1
pkgdesc="rcm, but faster"
arch=('any')
url="https://github.com/fictionic/rcm-fast"
license=('BSD')
provides=('rcm')
conflicts=('rcm' 'rcm-fast-git')
checkdepends=('cram')
source=("https://github.com/fictionic/rcm-fast/releases/download/v2.0.0/rcm-fast-2.0.0.tar.gz")
sha256sums=('20d5344ee7ef28bc1171505e3f4ac03eb130c2a1d9a26ab3956cda499f21aa35')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --disable-silent-rules \
    --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  LC_ALL=C make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

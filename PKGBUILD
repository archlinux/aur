pkgname=ahaha-git
pkgver=r183.77082be
pkgrel=1
pkgdesc="ANSI HTML Adapter fork with reverse HTML-to-ANSI conversion"
arch=('x86_64')
url="https://github.com/haturatu/ahaha"
license=('LGPL-2.0-or-later' 'MPL-1.1')
makedepends=('git')
provides=('ahaha')
conflicts=('ahaha')
source=('git+https://github.com/haturatu/ahaha.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ahaha"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/ahaha"
  make BINNAME=ahaha
}

check() {
  cd "$srcdir/ahaha"
  ./ahaha --help >/dev/null
}

package() {
  cd "$srcdir/ahaha"
  make DESTDIR="$pkgdir" PREFIX=/usr MANDIR=/usr/share/man BINNAME=ahaha install
  install -Dm644 LICENSE.LGPLv2+ "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPLv2+"
  install -Dm644 LICENSE.MPL1.1 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MPL1.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}

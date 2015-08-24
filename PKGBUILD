pkgname=cc65-git
pkgver=2.13.3.r6521.a85ac88
pkgrel=1
pkgdesc='C compiler for 6502 family microprocessors'
arch=('i686' 'x86_64')
makedepends=('linuxdoc-tools')
conflicts=('cc65')
provides=('cc65')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(git+https://github.com/cc65/cc65)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git//}"

  # Not tags (yet) in the Git repo.  Start off with the version of last release.
  printf "2.13.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname/-git//}"

  make
  make doc
}

package() {
  cd "$srcdir/${pkgname/-git//}"

  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}

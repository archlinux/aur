pkgname=cc65-git
pkgver=2.13.3.r7139.18b0aaf9f
pkgrel=1
pkgdesc='C compiler for 6502 family microprocessors'
arch=('i686' 'x86_64')
makedepends=('git' 'linuxdoc-tools')
conflicts=('cc65')
provides=('cc65')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(git+https://github.com/cc65/cc65 cc65.sh)
sha512sums=('SKIP'
            'eb45cf08a0fdc85ce34535447add9bcf4139e5515af229f16608b94f2a1cb8ab3cba4d79652212244f0657902c0a3768352f9a2bde7891f6e462a1e01d9dee6b')

pkgver() {
  cd "$srcdir/${pkgname/-git//}"

  # No tags (yet) in the Git repo.  Start off with the version of last release.
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
  install -Dm644 ../cc65.sh "$pkgdir/etc/profile.d/cc65.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}

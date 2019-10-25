# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pigz-git
pkgver=2.4.r24.gc3de75b
pkgrel=1
pkgdesc="A parallel implementation of gzip"
arch=('i686' 'x86_64')
url="https://zlib.net/pigz/"
license=('zlib')
depends=('glibc' 'zlib')
makedepends=('git')
provides=('pigz')
conflicts=('pigz')
source=("git+https://github.com/madler/pigz.git#branch=develop")
sha256sums=('SKIP')


prepare() {
  cd "pigz"

  sed -i 's/^CFLAGS=/CFLAGS?=/g;s/^LDFLAGS=/LDFLAGS?=/g' "Makefile"
}

pkgver() {
  cd "pigz"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pigz"

  make
}

check() {
  cd "pigz"

  #make test
}

package() {
  cd "pigz"

  install -Dm755 "pigz" -t "$pkgdir/usr/bin"
  ln -s "pigz" "$pkgdir/usr/bin/unpigz"

  install -Dm644 "pigz.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "pigz.pdf" -t "$pkgdir/usr/share/doc"
  install -Dm644 "README" -t "$pkgdir/usr/share/licenses/pigz"
}

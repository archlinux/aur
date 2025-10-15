# Maintainer: @rvid <contact@rvid.eu>
pkgname=libkyrka-git
pkgver=r133.c8ac731
pkgrel=1
pkgdesc="libkyrka implements the sanctum protocol in library form allowing you to establish sanctum tunnels directly from your application without the need for the actual daemon."
arch=('any')
url="https://github.com/jorisvink/libkyrka"
license=('ISC')
depends=('libsodium')
makedepends=('libsodium' 'git' 'make' 'gcc')
provides=('libkyrka')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$provides"
  # use git describe to generate a version like r123.abcdef1
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$provides"
  CFLAGS="-O2 -pipe -march=native -D_FORTIFY_SOURCE=2" make
}

package() {
  cd "$srcdir/$provides"
  CFLAGS="-O2 -pipe -march=native -D_FORTIFY_SOURCE=2" make PREFIX="/usr" DESTDIR="$pkgdir/" install
}

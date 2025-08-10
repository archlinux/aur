# Maintainer: Critlist <critlist at proton dot me>
pkgname=restohack
pkgver=1.0.3
pkgrel=1
pkgdesc="A faithful restoration of Hack v1.0.3 (1984), modernized and maintained"
arch=('x86_64')
url="https://github.com/Critlist/restoHack"
license=('BSD')
depends=('ncurses' 'glibc')
makedepends=('cmake' 'gcc' 'git')
source=("restoHack-${pkgver}.tar.gz::https://github.com/Critlist/restoHack/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d03e959430c6ab2a47a85a30336bc515bdaeb2496d369ad3a3368444d6ff639')
build() {
  cd "$srcdir/restoHack-${pkgver}"
  cmake -B build -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  cd "$srcdir/restoHack-${pkgver}"
  install -Dm755 build/hack "$pkgdir/usr/bin/hack"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 man/hack.6 "$pkgdir/usr/share/man/man6/hack.6"

  for file in data help hh rumors; do
    install -Dm644 "$file" "$pkgdir/usr/share/hack/$file"
  done
}

# Maintainer: Cask Strength

pkgname=archbeg
pkgver=0.1.0
pkgrel=1
pkgdesc="Software to use AUR (Arch User Repository) outside AUR."
arch=('x86_64')
url="https://codeberg.org/caskstrength/archbeg"
license=('MIT')
depends=('curl' 'libundr' 'libarchive')
makedepends=('gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('2080ac69ebd448e1786d36f0447b32a5223e2822199ee55731c9b4400511fe21f387cabc236bba9b99d62f744c6b0eb658ad313ec5178a46b680a494689bd52d')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -std=c23 -pedantic src/*.c -o archbeg -lcurl -lundr -larchive
}

package() {
  cd "$pkgname"

  install -Dm755 archbeg       "${pkgdir}/usr/bin/archbeg"
  install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

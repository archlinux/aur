# Maintainer: Cask Strength

pkgname=archbeg
pkgver=0.2.0
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
sha512sums=('f80f2735b604b09139a2c735e3b0e20fad59fce46faf38684ebec7cf52b21f27a452d453ef6f1587e4b9fc389d71319a5bf73f2d1b745a15accb511d28fb11a3')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -std=c23 -pedantic src/*.c -o archbeg -lcurl -lundr -larchive
}

package() {
  cd "$pkgname"

  install -Dm755 archbeg       "${pkgdir}/usr/bin/archbeg"
  install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

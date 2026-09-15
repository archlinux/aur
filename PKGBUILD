# Maintainer: Cask Strength

pkgname=archbeg
pkgver=0.2.1
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
sha512sums=('dcc55fe6996f76bbfa7ad030c5bfec408c16ec0b93157d845dfd5a03acd944c7f7973bcea2bd80f70e7cc7d89c08afa01aa933626b49d9aae506a3352871f4ba')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -std=c23 -pedantic src/*.c -o archbeg -lcurl -lundr -larchive
}

package() {
  cd "$pkgname"

  install -Dm755 archbeg       "${pkgdir}/usr/bin/archbeg"
  install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Cask Strength

pkgname=archbeg
pkgver=0.2.2
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
sha512sums=('06eac12905d0e7d6de533d0714420fc59c339ab0cbe574dfb33798deca777228e49e031477d52f40d06a2a7b77f122c55a7d71dbf87fcdc91fcea9cda3f0a1d3')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -std=c23 -pedantic src/*.c -o archbeg -lcurl -lundr -larchive
}

package() {
  cd "$pkgname"

  install -Dm755 archbeg       "${pkgdir}/usr/bin/archbeg"
  install -Dm644 LICENSE       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

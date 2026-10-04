# Maintainer: javy

pkgname=archbeg
pkgver=0.2.3
pkgrel=2
pkgdesc="Software to use AUR (Arch User Repository) outside AUR."
arch=('x86_64')
url="https://codeberg.org/javy/archbeg"
license=('MIT')
depends=('curl' 'libundr' 'libarchive')
makedepends=('gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('835f8884a7d571b93592bbc827d1856ecda7b39e7421bce9bbeb55f68bc1e384a4f9a18855c9e12338167f53dfea6f138c0eb37fda92bf7225815246f92584a6')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -std=c23 -pedantic -DGIT_TIMEOUT=180 src/*.c -o archbeg -lcurl -lundr -larchive
}

package() {
  cd "$pkgname"

  install -Dm755 archbeg "${pkgdir}/usr/bin/archbeg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

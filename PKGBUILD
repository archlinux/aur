# Maintainer: atriix <aur a snilius d com>

pkgname=migrate
pkgver=4.20.1
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=('365a1c5b517348301a540b04bda5d8778e61bff7e68583bcf2f278da570f4b46')
makedepends=("go" "git")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"
  make build VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/migrate/LICENSE"
}

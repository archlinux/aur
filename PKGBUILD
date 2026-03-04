# Maintainer: atriix <aur a snilius d com>

pkgname=migrate
pkgver=4.19.1
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=('677bf03c19d684dc5bef47e981ec1b4564482cbf5f9b190cb48e110183fd6d25')
makedepends=("go")

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

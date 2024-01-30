# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=5.8.5
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('go>=2:1.13')
source=("https://github.com/hebcal/hebcal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('82624c9ddec1c85e439081ef3840427b27c90a96e2dc1b638ae7aec6deb8b88e')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make all
# to specify default city at build time use "make DEFAULT_CITY=[CITY] all" See upstream github issue 244 
# available cities can be listed by running "$ hebcal cities"
}

 package() {
   cd "$pkgname-$pkgver"
    install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 NEWS.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 hebcal.1 -t "$pkgdir/usr/share/man/man1"
}

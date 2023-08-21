# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=5.8.1
pkgrel=2
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('go>=2:1.13')
source=("https://github.com/hebcal/hebcal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cfb17be1a0c112a03b06c339b70d5a0a519333da9a7f699728e77c6a88dc866b')

build() {
  cd "$pkgname-v$pkgver"
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

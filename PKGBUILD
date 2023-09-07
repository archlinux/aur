# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=5.8.2
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('go>=2:1.13')
source=("https://github.com/hebcal/hebcal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d881cac33e98cd55056bd38df863b3bcc4476ffda360871e35080ac57e9dc91')

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

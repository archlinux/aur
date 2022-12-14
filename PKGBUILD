# Contributor: snakeroot <cwa AT pipeline DOT com>
pkgname='hebcal'
pkgver=5.5,0
pkgrel=1
pkgdesc='A Jewish calendar generator'
arch=('any')
url='https://github.com/hebcal/hebcal'
license=('GPL2')
depends=('perl>=5.0' 'go>=2:1.13' 'gperf')
source=("https://github.com/hebcal/hebcal/archive/v${pkgver}.tar.gz")


build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make 
}

 package() {
   cd "$pkgname-$pkgver"
   install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
   install -Dm 644 NEWS.md -t "$pkgdir/usr/share/doc/$pkgname"
   install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
 
}

# Maintainer: Evan Sosenko <razorx@evansosenko.com>
pkgname=dynocsv
pkgver=1.1.4
pkgrel=1
pkgdesc="Exports DynamoDB table into CSV"
arch=('x86_64')
url="https://github.com/zshamrock/dynocsv"
license=('MIT')
makedepends=('go>=1.13')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zshamrock/dynocsv/archive/v${pkgver}.tar.gz")
sha256sums=('d1bf8ef2ad8b2c99385ddea2fa933b2fe7514df39f961f1b42abf9a199ab4bba')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  export GOPATH="${srcdir}"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  cd "$srcdir/$pkgname-$pkgver"
  go build -o $pkgname .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

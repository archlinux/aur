# Maintainer: Luis Pérez <luis.perez@protonmail.com>

pkgname=mmark
pkgver=2.2.21
pkgrel=1
pkgdesc='A powerful markdown processor in Go geared towards the IETF'
arch=('x86_64')
url="https://github.com/mmarkdown/mmark"
license=('BSD')
makedepends=(
             'go'
             'git'
)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c1219c7a5cf67947facd33283ccbabd4abb84cefca0741fd0188a65a2966ca3b')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

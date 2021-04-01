# Maintainer: lmartinez-mirror
pkgname=frangipanni-git
pkgver=0.4.0.r4.gff97e40
pkgrel=1
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go>=1.15')
provides=('frangipanni')
conflicts=('frangipanni')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname"
  go build
}

package() {
  cd "$pkgname"
  install -Dm 755 frangipanni -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

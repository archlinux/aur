# Maintainer: Fuero <fuerob@gmail.com>

pkgname=kor
# renovate: datasource=github-releases depName=yonahd/kor
pkgver=0.6.3
pkgrel=1
pkgdesc='Kubernetes Orphaned Resources Finder'
arch=('x86_64')
url=https://github.com/yonahd/kor
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/${pkgname}-$pkgver.tar.gz")
b2sums=('3aeda1ce3efa61bf6c0a701a83d862de13d94e99845171c2e979fe07a38d62377cdfb2b43de8538d3e41c7d78c3bdb8b78d348634cdd6d0315460fc5c37c2cd6')

prepare() {
  cd $pkgname-$pkgver
  go mod vendor
}

build() {
  cd $pkgname-$pkgver
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw"
  go build .
}

check() {
  cd $pkgname-$pkgver
  go test ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin $pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  for i in *.md
  do
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname $i
  done
}

# vim:set ts=2 sw=2 et:

# Maintainer: Fuero <fuerob@gmail.com>

pkgname=kor
# renovate: datasource=github-releases depName=yonahd/kor
pkgver=0.5.0
pkgrel=1
pkgdesc='Kubernetes Orphaned Resources Finder'
arch=('x86_64')
url=https://github.com/yonahd/kor
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/${pkgname}-$pkgver.tar.gz")
b2sums=('3722a80034f157a1f5941cec870b232203fe0af86949a4aabb60dbf9d49dde8801c6b5c619b1732e49a56bbd9efea230376bd4f442f0710e68d85afff983fcd8')

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

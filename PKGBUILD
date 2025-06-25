# Maintainer: Fuero <fuerob@gmail.com>

pkgname=kor
# renovate: datasource=github-releases depName=yonahd/kor
pkgver=0.6.2
pkgrel=1
pkgdesc='Kubernetes Orphaned Resources Finder'
arch=('x86_64')
url=https://github.com/yonahd/kor
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/${pkgname}-$pkgver.tar.gz")
b2sums=('087c4f490871be619e3e4542eb5d57a194a4f3e46cd074964dd6048a0b8f26bf3883f699f50d5a5c7ba71979ebc6d4c3e4933893c36952dfa4955231d4e02058')

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

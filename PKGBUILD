# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=mangadesk
pkgver=0.7.5
pkgrel=1
pkgdesc='Terminal client for MangaDex'
arch=('x86_64')
url="https://github.com/darylhjd/mangadesk"
license=('MIT')
# according to namcap, this is needed
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('aaf874d566f6114625d2f936ddfc30e5765517c292d9d9d47f00ccd6b0ff2670ef8ec113dbe019666b926a4d9e1341a0259f76cef2e64c731d85677f599598aa')

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
  go get -d ./...
  go build -o build ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

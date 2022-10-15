# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Joost Bremmer <joost@madeofmagicandwires.online>
# https://github.com/orhun/pkgbuilds

pkgname=pkgtop
pkgdesc="Interactive package manager & resource monitor"
pkgver=2.4.1
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/pkgtop"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('8f17780a16584216b434fc6bd37cb8422bf1d1d34ce4b6433bc469987199f4743a9a4a9368aa65db6ec6bc98d30291193be5d92954cf0d758576fc1d8ce501e2')

build() {
  cd "$pkgname-$pkgver/cmd"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver/cmd"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}

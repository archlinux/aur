# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Joost Bremmer <joost@madeofmagicandwires.online>
# https://github.com/orhun/pkgbuilds

pkgname=pkgtop
pkgdesc="Interactive package manager & resource monitor"
pkgver=2.5.1
pkgrel=2
arch=('x86_64')
url="https://github.com/orhun/pkgtop"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('96cdb85688e91e3d1b65c165450a5d148ffb26fe84f75c9759b13b5c2dc26b4a1f9d32c9a14e14299be01e71518988b50ec78cc50b5a35cf579da8e046360046')

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

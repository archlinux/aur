# Maintainer: gomanager <gomanager@generated>
pkgname=json2struct
pkgver=1.9.3
pkgrel=2
pkgdesc="CLI tool to convert JSON to struct type definitions"
arch=('x86_64' 'aarch64')
url="https://github.com/marhaupe/json2struct"
license=('GPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/marhaupe/json2struct.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

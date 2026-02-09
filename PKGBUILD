# Maintainer: gomanager <gomanager@generated>
pkgname=gowsdl
pkgver=0.5.0
pkgrel=2
pkgdesc="WSDL2Go code generation as well as its SOAP proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/hooklift/gowsdl"
license=('MPL-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/hooklift/gowsdl.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/gowsdl
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# Maintainer: gomanager <gomanager@generated>
pkgname=truss
pkgver=0.3.1
pkgrel=2
pkgdesc="Truss helps you build go-kit microservices without having to worry about writing or maintaining boilerplate code."
arch=('x86_64' 'aarch64')
url="https://github.com/metaverse/truss"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/metaverse/truss.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o cmd/truss/$pkgname \
    ./cmd/truss
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 cmd/truss/$pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

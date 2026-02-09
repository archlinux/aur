# Maintainer: gomanager <gomanager@generated>
pkgname=checkip
pkgver=0.49.0
pkgrel=2
pkgdesc="Get (security) info about IP addresses"
arch=('x86_64' 'aarch64')
url="https://github.com/jreisinger/checkip"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/jreisinger/checkip.git#tag=v$pkgver")
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

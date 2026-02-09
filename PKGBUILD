# Maintainer: gomanager <gomanager@generated>
pkgname=ovpm
pkgver=0.2.12
pkgrel=2
pkgdesc="OpenVPN Management Server - Effortless and free OpenVPN server administration tool"
arch=('x86_64' 'aarch64')
url="https://github.com/cad/ovpm"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/cad/ovpm.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/ovpm
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

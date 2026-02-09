# Maintainer: gomanager <gomanager@generated>
pkgname=saw
pkgver=0.2.2
pkgrel=3
pkgdesc="Fast, multi-purpose tool for AWS CloudWatch Logs"
arch=('x86_64' 'aarch64')
url="https://github.com/TylerBrock/saw"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/TylerBrock/saw.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go mod init github.com/TylerBrock/saw
  go mod tidy
  go build \
    -trimpath \
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

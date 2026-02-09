# Maintainer: gomanager <gomanager@generated>
pkgname=opsy
pkgver=0.0.3
pkgrel=2
pkgdesc="Opsy - Your AI-Powered SRE Colleague"
arch=('x86_64' 'aarch64')
url="https://github.com/datolabs-io/opsy"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/datolabs-io/opsy.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/opsy
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

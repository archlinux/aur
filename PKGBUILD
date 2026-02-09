# Maintainer: gomanager <gomanager@generated>
pkgname=enpasscli
_pkgname=enpass-cli
pkgver=1.9.0
pkgrel=3
pkgdesc="Enpass commandline client"
arch=('x86_64' 'aarch64')
url="https://github.com/hazcod/enpass-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/hazcod/enpass-cli.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$_pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/enpasscli
}

package() {
  cd "$_pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

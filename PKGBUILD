# Maintainer: gomanager <gomanager@generated>
pkgname=captain
pkgver=1.1.3
pkgrel=2
pkgdesc="Captain - Convert your Git workflow to Docker :whale: containers"
arch=('x86_64' 'aarch64')
url="https://github.com/harbur/captain"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/harbur/captain.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go mod init github.com/harbur/captain
  go mod tidy
  go build \
    -trimpath \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/captain
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

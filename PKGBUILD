# Maintainer: gomanager <gomanager@generated>
pkgname=snipkit
pkgver=1.8.1
pkgrel=2
pkgdesc="Snippet CLI manager for quickly generating and executing shell snippets without leaving the terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/lemoony/snipkit"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/lemoony/snipkit.git#tag=v$pkgver")
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

# Maintainer: Filip Weiss <minepkg+me@fiws.net>

pkgname=minepkg
pkgver=0.1.4
pkgrel=1
pkgdesc="Manage Minecraft mods with ease."
arch=('x86_64')
url="https://github.com/minepkg/minepkg"
license=('MIT')
groups=()
depends=()
makedepends=('go')
optdepends=()
source=("https://github.com/minepkg/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3fd60c1e67cc0de675b301694284ee25846e3c9614f9f153ef55710ef812ce33')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w -X main.version=$pkgver -X main.disableSelfupdate=yes" -o ./out/minepkg main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "out/minepkg" "$pkgdir/usr/bin/minepkg"
}

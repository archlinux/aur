# Maintainer: Kaine Killian kainekillian@proton.me
pkgname=desktopify-lite
pkgver=1.0.6
pkgrel=1
pkgdesc='CLI tool that generates Linux .desktop launchers for websites'
arch=('x86_64' 'aarch64')
url='https://github.com/miniguys/desktopify-lite'
license=('MIT')
makedepends=('git' 'go')
conflicts=('desktopify-lite-git')
# Use variable for tag so it updates automatically
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('846a90383bd822d552bf9200e134bb9098bc0d75f7101a04618a9fcaa3c5dd58')

build() {
  cd "$srcdir/$pkgname"

  # Use the existing Makefile and pass the version from PKGBUILD
  # This ensures consistency between local builds and AUR
  make build VERSION="$pkgver"
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

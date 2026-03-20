# Maintainer: Kaine Killian kainekillian@proton.me
pkgname=desktopify-lite
pkgver=1.0.3
pkgrel=1
pkgdesc='CLI tool that generates Linux .desktop launchers for websites'
arch=('x86_64' 'aarch64')
url='https://github.com/miniguys/desktopify-lite'
license=('MIT')
makedepends=('git' 'go')
conflicts=('desktopify-lite-git')
# Use variable for tag so it updates automatically
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('42cf8c2c7e4f7a1759d4f98e88e07465b866ab86cb7bf4086cf72818b6b06c87')

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

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
sha256sums=('f97edacee36a4e31c44d0baf8bd43f56bbe85640bfefff9194227ab583748324')

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

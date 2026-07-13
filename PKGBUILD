# Maintainer: WindustH <windusth2006@gmail.com>

_pkgname=calibre-tui
pkgname=$_pkgname-git
pkgver=0.5.1.r0.g936420c
pkgrel=1
pkgdesc="A TUI application to search and open books in your Calibre library."
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/calibre-tui"
license=('MIT')
depends=('xdg-utils' 'sqlite')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "preset/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}

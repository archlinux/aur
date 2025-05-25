# Maintainer: TostetLolz <me@toster.lol>
pkgname=grabbie-git
pkgver=latest
pkgrel=1
pkgdesc="Grabbie is a tool to download files and resources from various sources (latest, from git)."
arch=('x86_64')
url="https://github.com/tosterlolz/grabbie"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
provides=('grabbie')
conflicts=('grabbie')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags 2>/dev/null || echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/grabbie" "$pkgdir/usr/bin/grabbie"
  install -Dm644 README.md "$pkgdir/usr/share/doc/grabbie/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/grabbie/LICENSE"
}

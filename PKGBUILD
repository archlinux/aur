# Maintainer: Phillip Smith <pkgbuild@phs.id.au>

# I AM ONLY THE PACKAGER, NOT THE DEVELOPER
# Please ask support questions about this software in one of:
#   1) The AUR comments; OR
#   2) Upstream forums/maillist etc; OR
#   3) The ArchLinux forums
# I do not always know enough about the software itself, or don't have the time to promptly respond to direct emails.
# If you have found a problem with the package/PKGBUILD (as opposed to the software) then please do post an AUR comment.

pkgname=rotz
pkgver=0.10.0
pkgrel=1
pkgdesc="Fully cross platform dotfile manager written in rust."
arch=('x86_64')
url="https://volllly.github.io/rotz/"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('556ed5c1a1721307a9ccf6ca455cfdd12b148280d0be76b42f237455b825bc88')

options=(!lto)

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

# vim:set ts=2 sw=2 et:

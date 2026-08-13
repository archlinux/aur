# Maintainer: Gigas002 <gigas002@pm.me>

_pkgname=ratgreet
pkgname=ratgreet-git
pkgver=r305.ga47bbee
pkgrel=1
pkgdesc='Terminal login greeter for greetd, built with Rust and ratatui'
arch=('x86_64' 'aarch64')
url='https://github.com/Gigas002/ratgreet'
license=('GPL-3.0-or-later')
depends=('greetd' 'gcc-libs')
makedepends=('cargo' 'git')
provides=('ratgreet')
conflicts=('ratgreet')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen -p "$_pkgname"
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

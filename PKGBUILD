# Maintainer : envolution
# Contributor: mnussbaum
# Contributor: j.r <j.r@jugendhacker.de>

pkgname=stygiansift-git
_pkgname="StygianSift"
pkgver=r111+2539f820a
pkgrel=1
pkgdesc="A highly customizable TUI file explorer"
arch=("x86_64")
url="https://github.com/Mauitron/StygianSift"
license=("Custom")
makedepends=("git" "rust" "cargo")
source=("$_pkgname::git+https://github.com/Mauitron/StygianSift.git")
sha256sums=('SKIP')

pkgver(){
  cd "${srcdir}/${_pkgname}"
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "r${_commits}+${_short_commit_hash}"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/StygianSift" "$pkgdir/usr/bin/StygianSift"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim: ts=2 sw=2 et:

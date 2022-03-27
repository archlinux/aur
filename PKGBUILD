# Maintainer: icepie <icepie.dev@gmail.com>

pkgname="gnome-randr-rust"
_pkgname="gnome-randr"
pkgver=0.1.1.44.g688e0c2
pkgrel=1
pkgdesc="xrandr for Gnome/wayland, on distros that don't support wlr-randr"
arch=("x86_64")
url="https://github.com/maxwellainatchi/gnome-randr-rust"
license=("MIT")
depends=()
optdepends=()
makedepends=("rust" "cargo" "git")
provides=("gnome-randr")
conflicts=("gnome-randr")
source=("$_pkgname::git+https://github.com/maxwellainatchi/gnome-randr-rust.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  export SHELL_COMPLETIONS_DIR="$PWD/completions"
  cargo build --release
}

check() {
  cd $_pkgname
  cargo test --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}

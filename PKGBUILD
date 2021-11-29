# Maintainer: icepie <icepie.dev@gmail.com>

pkgname="gnome-egpu-git"
_pkgname="gnome-egpu"
pkgver=0.1.0.11.g41b77bb
pkgrel=1
pkgdesc="eGPU switcher for GNOME using udev rules"
arch=("x86_64")
url="https://github.com/dangreco/gnome-egpu"
license=("MIT")
depends=()
optdepends=()
makedepends=("rust" "cargo" "git")
provides=()
conflicts=("gnome-egpu")
source=("$_pkgname::git+https://github.com/dangreco/gnome-egpu.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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


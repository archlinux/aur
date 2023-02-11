# Maintainer: icepie <icepie.dev@gmail.com>

pkgname="gptcommit-git"
_pkgname="gptcommit"
pkgver=0.1.16.108.g6ee5bc5
pkgrel=1
pkgdesc="A git prepare-commit-msg hook for authoring commit messages with GPT-3. "
arch=("x86_64")
url="https://github.com/zurawiki/gptcommit"
license=("MIT")
depends=()
optdepends=()
makedepends=("rust" "cargo")
provides=()
conflicts=("gptcommit")
source=("$_pkgname::git+https://github.com/zurawiki/gptcommit.git")
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


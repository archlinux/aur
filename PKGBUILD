# Maintainer: Ben Mitchell <bjosephmitchell@gmail.com>
projectname=opman
pkgname="$projectname-git"
pkgver=r5.b83bef5
pkgver() {
  cd "$projectname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Opinionated ArchLinux Package Manager (WIP)'
arch=('any')
url="https://github.com/CRISPYricePC/$projectname"
license=('MIT')
groups=()
depends=()
makedepends=('cargo')
optdepends=()
provides=('opman')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${projectname}::git+$url.git")
noextract=()
md5sums=('SKIP')

prepare() {
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$projectname"
}
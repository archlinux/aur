#Maintainer: Pierre Chevalier <pierrechevalier83@gmail.com>

pkgname=reclog-git
_pkgname=reclog
pkgver=r17.4e02838
pkgrel=1
pkgdesc="Command-line tool to capture command output to a file."
url="https://github.com/gavv/reclog"
makedepends=('cargo' 'git')
arch=('i686' 'x86_64')
license=('MIT')
source=("git+https://github.com/gavv/reclog")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
    printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short HEAD)"
}



build() {
    cd "${srcdir}/${_pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/reclog "$pkgdir/usr/bin/reclog"
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

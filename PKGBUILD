pkgname=rust-clippy-git
_gitname=rust-clippy
pkgver=0.0.125.r2431.5cbe9b50
pkgrel=1
pkgdesc='A collection of lints to catch common mistakes and improve your Rust code'
url='https://github.com/Manishearth/rust-clippy'
arch=('x86_64' 'i686')
license=('MPL')
depends=('rust-git')
provides=('rust-clippy')
conflicts=('rust-clippy')
makedepends=('cargo')
source=("git+https://github.com/Manishearth/rust-clippy.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_gitname"
    echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"
}

build() {
  cd "$_gitname"

  cargo build --release
}

package() {
  cd "$_gitname"

  cargo install --root "$pkgdir/usr"
  rm "$pkgdir/usr/.crates.toml"
}

# vim:set ts=2 sw=2 et:

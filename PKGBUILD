# PKGBUILD created by using cargo-aur-packer
pkgname='node-cleaner-git'
pkgver=0.2.6
pkgrel=1
pkgdesc='A tool for cleaning and managing node_modules directories'
arch=('any')
url='no'
license=('MIT')
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')
source=('node-cleaner-git::git+https://github.com/Breinss/rust-node-modules-cleaner')

pkgver() {
 cd "$pkgname"
 echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

build() {
   cd "$pkgname"
   cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/node-cleaner -t "${pkgdir}/usr/bin"
  # install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/node-cleaner"
}


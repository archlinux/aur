# PKGBUILD created by using cargo-aur-packer
pkgname='gitini-git'
pkgver=0.4.0
pkgrel=1
pkgdesc='Init repository on Github and upload the current folder'
arch=('any')
url='https://github.com/florianfelix/gitini'
license=('MIT OR Apache-2.0')
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')
source=('gitini-git::git+https://github.com/florianfelix/gitini')

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
  install -Dm 755 target/release/gitini -t "${pkgdir}/usr/bin"
  # install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/gitini"
}


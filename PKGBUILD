# PKGBUILD created by using cargo-aur-packer
pkgname='codeonly-git'
pkgver=1.1.0
pkgrel=1
pkgdesc='Remove annoying comments from your code'
arch=('any')
url='https://github.com/LostInTheCloud/codeonly'
license=('GPL-2.0')
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')
source=('codeonly-git::git+https://github.com/LostInTheCloud/codeonly')

pkgver() {
 cd "$pkgname"
 echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

build() {
   cd "$pkgname"
   cargo build --release --all-features --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/codeonly -t "${pkgdir}/usr/bin"
  # install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/codeonly"
}


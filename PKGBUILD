# PKGBUILD created by using cargo-aur
pkgname='themefox-manager-git'
pkgver=0.9.11
pkgrel=1
pkgdesc='A manager for firefox CSS aka userchrome files'
arch=('any')
url='https://github.com/themefox/themefox-manager'
license=('MIT')
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')
source=('themefox-manager-git::git+https://github.com/themefox/themefox-manager')

pkgver() {
 cd "$pkgname"
 echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

build() {
   cargo build --release --locked --all-features --target-dir=target
}

check() {
  cargo test --release --locked --target-dir=target
}

package() {
  install -Dm 755 target/release/themefox-manager -t "${pkgdir}/usr/bin"
  # install -Dm 755 $pkgname/LICENSE "${pkgdir}/usr/share/licenses/themefox-manager"
}


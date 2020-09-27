# PKGBUILD created by using cargo-aur
pkgname='yas-git'
pkgver=0.1.0
pkgrel=1
pkgdesc='A sudo replacement, written in rust'
arch=('any')
url='https://github.com/alx365/yas'
license=('MIT')
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')
source=('yas-git::git+https://github.com/alx365/yas')

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
  install -Dm 755 target/release/yas -t "${pkgdir}/usr/bin"
  # install -Dm 755 $pkgname/LICENSE "${pkgdir}/usr/share/licenses/yas"
}


# PKGBUILD created by using cargo-aur
pkgname='auswahl-git'
pkgver=0.1.1
pkgrel=1
pkgdesc='A tool to create dmenu or rofi menus using a simple declaration syntax.'
arch=('any')
url='https://github.com/elkowar/Auswahl'
license=('Unlicense')
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')
source=('auswahl-git::git+https://github.com/elkowar/Auswahl')

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
  install -Dm 755 target/release/auswahl -t "${pkgdir}/usr/bin"
  # install -Dm 755 $pkgname/LICENSE "${pkgdir}/usr/share/licenses/auswahl"
}


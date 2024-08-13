# Maintainer: Frey Frazão <bcfrazao@gmail.com>
# Contributor: Donovan Glover <https://donovan.is/>
pkgname=hyprnome
pkgver=0.3.1
pkgrel=1
pkgdesc="GNOME-like workspace switching in Hyprland."
arch=('x86_64')
url="https://github.com/donovanglover/hyprnome"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/donovanglover/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/hyprnome" "$pkgdir/usr/bin/hyprnome"

  install -Dm644 "target/completions/_hyprnome" "$pkgdir/usr/share/zsh/site-functions/_hyprnome"
  install -Dm644 "target/completions/hyprnome.bash" "$pkgdir/usr/share/bash-completion/completions/hyprnome"
  install -Dm644 "target/completions/hyprnome.fish" "$pkgdir/usr/share/fish/vendor_completions.d/hyprnome.fish"
  install -Dm644 "target/man/hyprnome.1" "$pkgdir/usr/share/man/man1/hyprnome.1"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

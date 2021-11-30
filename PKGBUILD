#Maintainer: Justine Smithies <justine at smithies dot me dot uk>
pkgname=swayr-git
pkgver=v0.10.1.r3.c23ab5f2
pkgrel=1
pkgdesc="Swayr is a window switcher (and more) for sway"
arch=('x86_64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname%-*}::git+https://git.sr.ht/~tsdh/swayr/")
md5sums=('SKIP')

pkgver() {
  cd swayr
  git describe --long --tags --abbrev=8 | sed 's/^short-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/.g/./g'
}

build() {
   cd swayr
   RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
   cd swayr
   RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
    cd swayr
    install -Dm755 "target/release/swayr" "$pkgdir/usr/bin/swayr"
    install -Dm755 "target/release/swayrd" "$pkgdir/usr/bin/swayrd"
}


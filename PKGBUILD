# Maintainer: Walter - "d2Nhc2Fub3ZhQGRpc3Jvb3Qub3JnCg==" - use base64 -d

pkgname="starship-git"
_pkgname="starship"
pkgver=0.50.0.1370.gd0951db3
pkgrel=1
pkgdesc="The cross-shell prompt for astronauts"
arch=("x86_64")
url="https://github.com/starship/starship"
license=("ISC")
depends=()
optdepends=('powerline-fonts: powerline symbols for terminals'
            'nerd-fonts-complete: popular collections such as Font Awesome & fonts such as Hack')
makedepends=("rust" "cargo" "git")
provides=("starship")
conflicts=("starship")
source=("$_pkgname::git+https://github.com/starship/starship.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

 build() {
  cd $_pkgname
  cargo build --release --locked --all-features --target-dir=target
 }

check() {
   cd $_pkgname
   cargo test --release --locked --target-dir=target
 }

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Walter C <bitlord@disroot.org>

pkgname="starship-git"
_pkgname="starship"
pkgver=0.27.0.580.g1de281e
pkgrel=1
pkgdesc="The cross-shell prompt for astronauts"
arch=("x86_64")
url="https://github.com/starship/starship"
license=("ISC")
depends=()
optdepends=('powerline-fonts: powerline symbols for terminals'
            'nerd-fonts-complete: popular collections such as Font Awesome & fonts such as Hack')
makedepends=("rust" "cargo" "git")
provides=()
conflicts=("starship")
source=("$_pkgname::git+https://github.com/starship/starship.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    cargo build --release --locked
}
    
check() {
    cd $_pkgname
    cargo test --locked
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

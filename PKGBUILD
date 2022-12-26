# Maintainer : Simon <viknesh.adi@gmail.com>
_pkgname=bltui
pkgname=${_pkgname}-git
pkgver=0.1.3
pkgrel=2
pkgdesc="Bluetooth TUI"
arch=("x86_64")
license=("MIT")
url="https://github.com/simonadi/bltui"
depends=("bluez")
makedepends=("cargo" "git")
provides=("bltui")
conflicts=("bltui")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd $_pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname
    cargo build --frozen --release
}

check() {
    cd $_pkgname
    cargo check --frozen --release
}

package() {
    cd $_pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

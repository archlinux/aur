# Maintainer : Simon <viknesh.adi@gmail.com>
pkgname=bltui
pkgver=0.1.3
pkgrel=1
pkgdesc="Bluetooth TUI"
arch=("x86_64")
license=("MIT")
url="https://github.com/simonadi/bltui"
depends=("bluez")
makedepends=("cargo" "git")
provides=("bltui")
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/simonadi/${pkgname}/archive/${pkgver}.tar.gz")
# source=("${pkgname}-${pkgver}.tar.gz")
source=("git+https://github.com/simonadi/bltui.git")


pkgver() {
    convco version --bump
}

prepare() {
    cd $pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname
    cargo build --frozen --release
}

check() {
    cd $pkgname
    cargo check --frozen --release
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

sha256sums=('49ab1b965a7368543375ba0fe78b9f1ec2c2db3343afb053de783dd5d89cd0aa')
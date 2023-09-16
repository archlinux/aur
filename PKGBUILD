# Maintainer: Jorge Alejandro Jimenez Luna <jorgeajimenezl17@gmail.com>

pkgname=proxyswarm
pkgver=0.4.1
pkgrel=1
pkgdesc="Lightweight proxy that allows redirect HTTP(S) traffic through a proxy."
arch=('x86_64')
url="https://github.com/jorgeajimenezl/proxyswarm"
license=('MIT')
depends=()
makedepends=('git' 'cargo')

provides=("$pkgname")
source=("$pkgname-$pkgver::git+https://github.com/jorgeajimenezl/$pkgname.git")
sha1sums=('SKIP')

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/$pkgname-$pkgver"
    git checkout tags/v$pkgver -b $pkgver
    cargo build --release --all-features
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/etc/" "$pkgname.conf"
    install -Dm0755 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"
}

post_install() {
    echo "REMEMBER: Edit the configuration file /etc/$pkgname.conf"
}

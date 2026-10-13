# Maintainer: KOWX712 <KOWX712@leecc0503@gmail.com>
pkgname=mmu-vpn
pkgver=1.0.1
pkgrel=1
pkgdesc="OpenFortiVPN tray wrapper for Multimedia University"
arch=('x86_64')
url="https://github.com/KOWX712/mmu-vpn"
license=('GPL-3.0')
depends=('openfortivpn' 'polkit' 'xdotool')
makedepends=('cargo')
options=('!debug')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('27651d0cbb379c202ec717465f2606ba2d95a1c5b5e799517363a3bfc8371da4')

prepare() {
    cd "$pkgname-$pkgver/daemon"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --locked --release --manifest-path daemon/Cargo.toml
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 daemon/target/release/mmuvpn "$pkgdir/usr/bin/mmuvpn"
    install -Dm644 daemon/mmuvpn.desktop "$pkgdir/usr/share/applications/mmuvpn.desktop"
    install -Dm644 daemon/polkit/cc.kowx712.fortivpn.policy "$pkgdir/usr/share/polkit-1/actions/cc.kowx712.fortivpn.policy"
    install -Dm644 daemon/polkit/50-openfortivpn.rules "$pkgdir/usr/share/polkit-1/rules.d/50-openfortivpn.rules"
}

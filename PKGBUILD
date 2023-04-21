# Maintainer: Code002Lover <admin at ipost dot rocks>
pkgname="ipass"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A simple password manager"
arch=('any')
depends=('rust' 'openssl')
license=('custom')
source=('https://github.com/002Hub/IPass-GUI/archive/refs/tags/v'$pkgver'.tar.gz')
sha256sums=('SKIP')
url="https://github.com/002Hub/IPass-GUI"

build() {
    cd IPass-GUI-$pkgver
    if cd library/.git; then cd .. && git pull && cd ..; else git clone https://github.com/002Hub/IPass-library library; fi
    cd src-tauri
    cargo build --release
}

package() {
    install -Dm755 IPass-GUI-$pkgver/src-tauri/target/release/ipass-gui -t "$pkgdir/usr/bin"
}
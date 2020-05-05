# Maintainer: Jesse Luehrs <doy@tozt.net>
pkgname=rbw-git
_name=${pkgname%-*}
pkgver=0.2.1
pkgrel=1
makedepends=('rust' 'cargo' 'git')
depends=('pinentry' 'openssl')
conflicts=('rbw' 'rbw-bin')
provides=('rbw')
arch=('i686' 'x86_64')
url="https://git.tozt.net/${_name}"
source=(git+https://git.tozt.net/${_name})
sha256sums=('SKIP')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

build() {
    cd "${_name}"
    cargo build --release --locked
}

check() {
    cd "${_name}"
    cargo test --release --locked
}

package() {
    cd "${_name}"
    install -Dm 755 target/release/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 target/release/rbw-agent -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

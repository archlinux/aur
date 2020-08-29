# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=trove_downloader
pkgver=2.1.5
_pkghash=4be4b050ff19b0168863cfd4ba20235aaba292a1
pkgrel=1
pkgdesc="Command line downloader for Humble Bundle Trove"
arch=('x86_64')
url="https://gitlab.com/silver_rust/trove_downloader"
license=('custom:Blue Oak Model License')
depends=('gcc-libs')
makedepends=('rust')
provides=('trove_downloader')
conflicts=('trove_downloader')
source=("${url}/-/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dc88d897ea0ffa2c3d08c49b3fe1cda2ee350e42a6e723d1c086b6790695663b')
install=${pkgname}.install
build() {
    cd "${pkgname}-v${pkgver}-${_pkghash}"
    cargo build --release
}
package() {
    cd "${pkgname}-v${pkgver}-${_pkghash}"
    mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/"
}

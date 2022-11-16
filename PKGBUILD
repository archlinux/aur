# Maintainer: Margret Riegert <margret at eowyn net>

pkgname=trove_downloader
pkgver=2.1.9
_pkghash=f377dcd6a39a6e4cd65412e56cdf2cdbbbb53df5
pkgrel=3
pkgdesc="Command line downloader for Humble Bundle Trove"
arch=('x86_64')
url="https://gitlab.com/silver_rust/trove_downloader"
license=('custom:Blue Oak Model License')
depends=('gcc-libs')
makedepends=('rust')
provides=('trove_downloader')
conflicts=('trove_downloader')
source=("${url}/-/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5759e26b7597a14a04b885306b9aa17a596295184f61710a2f9fcced9737ff46')
install=${pkgname}.install
build() {
    cd "${pkgname}-v${pkgver}-${_pkghash}"
    cargo build --release
}
package() {
    cd "${pkgname}-v${pkgver}-${_pkghash}"
    mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/"
}

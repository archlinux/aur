# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=cnats
pkgver=0.2.2
pkgrel=1
pkgdesc="Web chat over NATS subjects with Kanidm SSO (Leptos SSR)"
arch=('x86_64' 'aarch64')
url="https://prosjekt.klingenbergbygg.no/bl/cnats"
license=('MIT')
depends=('glibc' 'gcc-libs')
optdepends=(
    'nats-server: local message bus'
    'postgresql: local message history archive'
)
provides=('cnats')
conflicts=('cnats-git' 'cnats-bin')
backup=('etc/cnats/env')
source_x86_64=("cnats-v${pkgver}-x86_64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/cnats/releases/download/v${pkgver}/cnats-v${pkgver}-x86_64.tar.gz")
source_aarch64=("cnats-v${pkgver}-aarch64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/cnats/releases/download/v${pkgver}/cnats-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('da757c2aeb9bbec9b0336889c21ada5e20fa97b8886e297d5f8ee7b106de2a3d')
sha256sums_aarch64=('8676695a97248661ab5036b1ef73c42b73b9768eb6a6785e17cde1d24e70b326')

package() {
    install -Dm755 cnats "$pkgdir/usr/bin/cnats"

    # Hydration wasm/js + css served by the binary (LEPTOS_SITE_ROOT).
    install -dm755 "$pkgdir/usr/share/cnats"
    cp -r site "$pkgdir/usr/share/cnats/site"

    install -Dm644 cnats.service "$pkgdir/usr/lib/systemd/system/cnats.service"
    install -Dm600 cnats.env "$pkgdir/etc/cnats/env"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

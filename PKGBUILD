# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=cnats
pkgver=0.2.3
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
sha256sums_x86_64=('60f2a2bcc522c25c9bf1bdbe72ac2db19fe591a317b4bbf24cfb17e1dcd42a4b')
sha256sums_aarch64=('736abc9e611aae3a295f469117f5a5a0d05e9bade0b4cf4724e3f02bd2fca5a7')

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

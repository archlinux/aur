# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=cnats
pkgver=0.4.2
pkgrel=1
pkgdesc="Web chat over NATS subjects with Kanidm SSO (Leptos SSR)"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://project.uhhm.no/uhhm/cnats"
license=('MIT')
depends=('glibc' 'gcc-libs')
optdepends=(
    'nats-server: local message bus'
    'postgresql: local message history archive'
)
provides=('cnats')
conflicts=('cnats-git' 'cnats-bin')
backup=('etc/cnats/env')
source_x86_64=("cnats-v${pkgver}-x86_64.tar.gz::https://project.uhhm.no/uhhm/cnats/releases/download/v${pkgver}/cnats-v${pkgver}-x86_64.tar.gz")
source_aarch64=("cnats-v${pkgver}-aarch64.tar.gz::https://project.uhhm.no/uhhm/cnats/releases/download/v${pkgver}/cnats-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('e5be4fa6d9adf9b799b6517d28e832bdb855f0c544fc3b7e58737e671a5881a6')
sha256sums_aarch64=('59e7bcfe5670cedc1c0c344d34a972a0d683c8259b1cd7504a2680ca113178f6')

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

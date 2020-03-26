# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin-2
pkgver='0.2.1'
pkgrel=0
arch=('x86_64')
pkgdesc='A command scheduler for shells'
license=('MIT')
conflicts=('pueue-git' 'pueue' 'pueue-bin')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=(
    "pueue-linux-amd64-${pkgver}::https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueue-linux-amd64"
    "pueued-linux-amd64-${pkgver}::https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueued-linux-amd64"
)
sha256sums=('SKIP'
            'SKIP')


package() {
    install -Dm755 "pueue-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "pueued-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/pueued"

    tar xf "v${pkgver}.tar.gz"
    cd "pueue-${pkgver}"

    # Place systemd user service
    install -Dm644 "utils/pueued.service" "${pkgdir}/usr/lib/systemd/user/pueued.service"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/pueue/LICENSE"
}

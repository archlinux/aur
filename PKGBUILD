# Maintainer: tgiachi <tom@orivega.io>
pkgname=arrr-tray-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="System tray client for the Arrr Linux notification aggregator"
arch=('x86_64')
url="https://github.com/tgiachi/Arrr"
license=('MIT')
depends=('dbus' 'libnotify' 'libx11' 'libice' 'libsm' 'fontconfig')
optdepends=(
    'arrr-bin: Arrr notification aggregator daemon (required for full functionality)'
)
provides=('arrr-tray')
conflicts=('arrr-tray' 'arrr-tray-git')
install=arrr-tray-bin.install
source=(
    "arrr-tray-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/tgiachi/Arrr/releases/download/v${pkgver}/arrr-tray-${pkgver}-1-x86_64.pkg.tar.zst"
    "arrr-tray.desktop"
)
sha256sums=(
    'cd3ead8afb69e708bb50ffb409355cc1e32cf630e167724bacbba43e46f89c2a'
    'SKIP'
)
noextract=("arrr-tray-${pkgver}-1-x86_64.pkg.tar.zst")

prepare() {
    bsdtar xf "arrr-tray-${pkgver}-1-x86_64.pkg.tar.zst"
}

package() {
    install -Dm755 usr/local/bin/arrr-tray "${pkgdir}/usr/bin/arrr-tray"
    install -Dm644 arrr-tray.desktop \
        "${pkgdir}/etc/xdg/autostart/arrr-tray.desktop"
}

# Maintainer: tgiachi <tom@orivega.io>
pkgname=arrr-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Linux desktop notification aggregator daemon — aggregates RSS, IMAP, Teams and more into one place"
arch=('x86_64')
url="https://github.com/tgiachi/Arrr"
license=('MIT')
depends=('dbus' 'libnotify')
optdepends=(
    'libnotify: desktop popup notifications via D-Bus'
)
provides=('arrr')
conflicts=('arrr')
backup=()
install=arrr-bin.install
source=(
    "arrr-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/tgiachi/Arrr/releases/download/v${pkgver}/arrr-${pkgver}-1-x86_64.pkg.tar.zst"
    "arrr.service"
)
sha256sums=(
    '3bab3aaac895ed96fd4e2fd82347b0c08f0e36a8532798ed5b4c0f394be823f6'
    'SKIP'
)
noextract=("arrr-${pkgver}-1-x86_64.pkg.tar.zst")

prepare() {
    bsdtar xf "arrr-${pkgver}-1-x86_64.pkg.tar.zst"
}

package() {
    install -Dm755 usr/local/bin/arrr "${pkgdir}/usr/bin/arrr"
    install -Dm644 arrr.service "${pkgdir}/usr/lib/systemd/user/arrr.service"
}

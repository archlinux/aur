# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=inmarsat-sniffer-git
pkgver=r128.2827b3a
pkgrel=1
pkgdesc="Standalone Inmarsat L-band decoder — STD-C EGC + Aero ACARS/ADS-C/CPDLC"
arch=(
    'x86_64'
    'armv7h'
    'aarch64'
)
url="https://github.com/alphafox02/inmarsat-sniffer"
license=('GPL-3.0-only')
makedepends=(
    'cmake'
    'git'
)
optdepends=(
    'airspy'
    'bladerf'
    'hackrf'
    'libacars'
    'libuhd'
    'libsdrplay'
    'libsodium'
    'mosquitto'
    'rtl-sdr'
    'soapysdr'
    'zeromq'
)
provides=(
    'inmarsat-sniffer'
)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    cmake .
    make
}

package() {
    cd "$pkgname"
    install -Dm755 "inmarsat-sniffer" "$pkgdir/usr/bin/inmarsat-sniffer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


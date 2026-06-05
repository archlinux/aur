# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=iridium-sniffer-git
pkgver=r149.eb2f8d7
pkgrel=1
pkgdesc="Standalone Iridium satellite burst detector and demodulator in C"
arch=(
    'x86_64'
    'armv7h'
    'aarch64'
)
url="https://github.com/alphafox02/iridium-sniffer"
license=('GPL-3.0-or-later')
depends=(
    'fftw'
)
makedepends=(
    'cmake'
    'git'
)
optdepends=(
    'bladerf'
    'hackrf'
    'libacars'
    'libuhd'
    'libsdrplay'
    'soapysdr'
    'zeromq'
)
provides=(
    'iridium-sniffer'
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
    install -Dm755 "iridium-sniffer" "$pkgdir/usr/bin/iridium-sniffer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


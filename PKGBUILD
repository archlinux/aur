# Maintainer: Zac Bowling <zac@zacbowling.com>
pkgname=mt76-mt7925-dkms
pkgver=1.4.0
pkgrel=1
pkgdesc="MediaTek MT7925/MT7921 WiFi driver with MLO fixes (DKMS)"
arch=('any')
url="https://github.com/zbowling/mt7925"
license=('ISC' 'GPL-2.0-only')
depends=('dkms' 'linux-firmware')
optdepends=(
    'linux-headers: build for default kernel'
    'clang: for clang-built kernels'
    'lld: for clang-built kernels'
)
provides=('mt7925-dkms')
conflicts=('mt7925-dkms')
options=('!strip')
install=mt76-mt7925-dkms.install
# SHA256 checksum will be updated by CI when creating releases
source=("https://github.com/zbowling/mt7925/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ba6d53d6c8643c82eafb09868ae9eb96b03052738b24d991d5070b870a8c2e6a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/src/mt76-mt7925-${pkgver}"
    # Keep src/ directory structure - dkms.conf expects it
    cp -r src "${pkgdir}/usr/src/mt76-mt7925-${pkgver}/"
    cp dkms.conf "${pkgdir}/usr/src/mt76-mt7925-${pkgver}/"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Ash <xash at riseup d0t net>
# Contributor: Konstantin Rannev <konstantin d0t rannev at gmail d0t com>

pkgname=lsfg-vk-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="Lossless Scaling Frame Generation on Linux"
arch=("x86_64")
url="https://github.com/PancakeTAS/lsfg-vk"
license=('GPL-3.0-or-later')
depends=(
    'vulkan-icd-loader'
    'gcc-libs'
    'gtk4'
    'libadwaita'
    'hicolor-icon-theme'
)
makedepends=()
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
source=("https://github.com/PancakeTAS/lsfg-vk/releases/download/v${pkgver}/lsfg-vk-${pkgver}.$CARCH.tar.zst"
        "LICENSE")
sha256sums=('7e31d6f39da271fbc50ae8a1b092cb874bc6664765d5b7359d38970057f5fcff'
            '81fd6d483875f1d1520fa327f2139eda0bae28106863953ec57171d60a356b2f')
install=lsfg-vk.install
noextract=("lsfg-vk-${pkgver}.$CARCH.tar.zst")
options=(!strip)

package() {
    cd "$srcdir"

    # unpack the downloaded archive straight into pkgdir
    tar -xpf "lsfg-vk-${pkgver}.$CARCH.tar.zst" --no-same-owner --exclude='.PKGINFO' -C "$pkgdir"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

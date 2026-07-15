# Maintainer: Guru <anjanaya@gmail.com>
# Upstream (website): https://kotlin-toolchain.org
# Upstream (source):  https://github.com/JetBrains/kotlin-toolchain
#
# This package ships ONLY the official upstream bootstrap wrapper (the same
# script served by `curl -fsSL https://kotl.in/install.sh | sh`), installed as
# /usr/bin/kotlin. On first run it downloads the Kotlin Toolchain distribution
# and a Zulu JDK 25 into ~/.cache/JetBrains/Kotlin/cli, so no Java dependency
# is declared and the heavy (~340 MB) download happens at runtime, per user.

pkgname=kotlin-toolchain
pkgver=0.11.1
pkgrel=1
pkgdesc="JetBrains Kotlin Toolchain CLI (Amper) -- bootstrap wrapper that downloads its own JDK and toolchain distribution on first run"
arch=('any')
url="https://kotlin-toolchain.org"
license=('Apache-2.0')
depends=('curl')
conflicts=('kotlin')
source=("kotlin::https://packages.jetbrains.team/maven/p/amper/amper/org/jetbrains/kotlin/kotlin-cli/${pkgver}/kotlin-cli-${pkgver}-wrapper"
        "LICENSE.txt::https://raw.githubusercontent.com/JetBrains/kotlin-toolchain/v${pkgver}/LICENSE.txt"
        "NOTICE.txt::https://raw.githubusercontent.com/JetBrains/kotlin-toolchain/v${pkgver}/NOTICE.txt")
noextract=('kotlin')
sha256sums=('6dbcdde0bcae41705c187aefb6c91c6c29ef9079c8072a473c2149151f8d7962'
            'f9a85c61ba4fe8bacc300053b3384b5fc7d9f585a08dc7b9a465b7c0716c4f50'
            'c88ce978e9c66bd27e0b301a4950b5cb62919de395420c229077879420adbcf4')

package() {
    install -Dm755 "${srcdir}/kotlin" "${pkgdir}/usr/bin/kotlin"
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 "${srcdir}/NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"
}

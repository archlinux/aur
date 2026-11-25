# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=3.6.0
pkgrel=1
pkgdesc='Prompt to code to deployment in your terminal'
arch=(aarch64 x86_64)
url=https://kiro.dev/cli/
# By downloading and using Kiro CLI, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=(LicenseRef-Kiro)
depends=(glibc libgcc libstdc++)
options=(!debug)
source=(Kiro-LICENSE.txt)
source_x86_64=($pkgname-$pkgver-x86_64.tar.zst::https://prod.download.cli.kiro.dev/stable/$pkgver/kirocli-x86_64-linux.tar.zst)
source_aarch64=($pkgname-$pkgver-aarch64.tar.zst::https://prod.download.cli.kiro.dev/stable/$pkgver/kirocli-aarch64-linux.tar.zst)
sha256sums=('1840298f83a857294aa3f5adfc85835127499df54c557d8c3df76f04a56acf55')
sha256sums_aarch64=('a3055a84cecfde75d2d7b0e81f2d8ffe789814ce894a183ce8b3915e0afbb5e5')
sha256sums_x86_64=('653b576141fc3886c7ca4ac6ee47a5d00138fcf1d8d1e90eebc1e7d16e626a3c')
b2sums=('67ddcca288e9f92ee33d5f1e56dd66164542f4f85421a0c6004f55ff94b961b8db6908b249dea65c68c048925acf11c82d0f6c24f7da3948249ecf2aa4ce3880')
b2sums_aarch64=('6c00c67d57b932d36c316802e20cab2c233ea18b20a17d8c129db9c5a72d2859cc1a2f873f65f41c0416b01dceeb0e22f1fddd27d334a20f27334fc7a7150c7c')
b2sums_x86_64=('e6dd1882167939ce512e600c7824d6f31a7c76b8763e87ec93ae6b487acdbab439b1382792f0d237cae4af8188dbbc9957f27b319119fe9d5f0b683ca751bcdd')

build() {
    cd kirocli
    ./bin/kiro-cli _ extract-runtime --dir "$srcdir/runtime"
}

package() {
    cd kirocli
    install -Dm755 bin/kiro-cli -t "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/kiro-cli"
    cp -a "$srcdir"/runtime/*/ "$pkgdir/usr/lib/kiro-cli/"
    install -Dm644 "$srcdir/Kiro-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

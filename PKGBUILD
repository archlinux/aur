# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=3.5.0
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
sha256sums_aarch64=('0eaeec9a8d86c851c846b02b05ad104061f8bbffb5f7d01772e1e6ce9d4d7d1c')
sha256sums_x86_64=('d7fb9b1bdc601ef9b05df889113fa6a9e4f532c4e6b0ac363c985d4983e6e506')
b2sums=('67ddcca288e9f92ee33d5f1e56dd66164542f4f85421a0c6004f55ff94b961b8db6908b249dea65c68c048925acf11c82d0f6c24f7da3948249ecf2aa4ce3880')
b2sums_aarch64=('d479a4dcc1b4a444244d52ba46a6043b0e28b7075ec207b8ce95acb9a5e19066d2f2067196a6a2bc602d2e8fabe9c19ccb3261fb72d873f2b1a6b6f9de1d5a44')
b2sums_x86_64=('17822543d6fc78421cc2412a8ef808ddce36d260b2a188881a5ac7ccf31a72825c0235f7f8266e505f458c382f61aff82fe33929d4f3fb61f3170bbd5e4683be')

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

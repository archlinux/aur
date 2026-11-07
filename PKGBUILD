# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=3.1.0
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
sha256sums_aarch64=('eb9d7eaeb191810c01186471b6f7a7eca12180fecdcdd17e77293bc1e4d31ee1')
sha256sums_x86_64=('9efc69489e07892f40f6e4e29c5105a5feaff47d507fd2bde32f3974097a2477')
b2sums=('67ddcca288e9f92ee33d5f1e56dd66164542f4f85421a0c6004f55ff94b961b8db6908b249dea65c68c048925acf11c82d0f6c24f7da3948249ecf2aa4ce3880')
b2sums_aarch64=('63c031425ea168835e27a6dba597b41428d6f00ffe5c448d36688295ead4980ec738ed6d8ac3de797cd34a0b631039e55302a6d4a54c56075448a35bfe73244e')
b2sums_x86_64=('c634b54b0047083402e72ae1c3902fd80854690b5cd433cd1f6c9cbd132a27e270af3e73def42201b2aceb62ff28427263c53a9e36599099cbb00821faed2027')

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

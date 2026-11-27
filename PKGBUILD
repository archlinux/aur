# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=3.6.2
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
sha256sums_aarch64=('e1e808fcaadfa352cc79ce385e9d0ecfc50fb697e854dcc4b5b2f1884e65c735')
sha256sums_x86_64=('460e65cf499371800320bdc15c24eda9cd236ad11eea0f585d808a5ba0e808f5')
b2sums=('67ddcca288e9f92ee33d5f1e56dd66164542f4f85421a0c6004f55ff94b961b8db6908b249dea65c68c048925acf11c82d0f6c24f7da3948249ecf2aa4ce3880')
b2sums_aarch64=('aba6e1a0a4df55ec765b58a7ca288a70ce6a1a24ceb9ad5f4dc2f7bae8e174dbf6dd91c1ba935080056153e7caab822b7444b0568aa6f7601be6a9a3ce66c0d7')
b2sums_x86_64=('70c756b2d8c5a423b4189cddab722e31da454129da7b22303420aa121e982a5a728164cd94cc061b9a5679152d2cefce1bc87e9b9b37940f437d7dde7b3fb65d')

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

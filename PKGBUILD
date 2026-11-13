# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli
pkgver=3.3.0
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
sha256sums_aarch64=('9898e28e63cbd7985fc9ffa3aa298a23fd1c4ade65d415aebf364a7cf42edca1')
sha256sums_x86_64=('161454e79cb08e1a43be8c158ebd3019dbc2ea83f77383dd55d95a47af5f8573')
b2sums=('67ddcca288e9f92ee33d5f1e56dd66164542f4f85421a0c6004f55ff94b961b8db6908b249dea65c68c048925acf11c82d0f6c24f7da3948249ecf2aa4ce3880')
b2sums_aarch64=('e415b44b5de460704f9a441aaee41a4d8b0229cb20782a068fb16348781abbf12223e805e60cfa48b9e02489967488e2f49fb3a581571fb57da663df6dc7196a')
b2sums_x86_64=('ceb1dbfbe9e979aa1780ad144ce8ce7bba0783197ba53daec857cdd354bd70619d86cc41f1ba3ac0453b0521bcf33e923c8731e595b8af06ae63f7f55f2ec90d')

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

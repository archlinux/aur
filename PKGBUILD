# Maintainer: Tuomas Siipola <siiptuo at kapsi dot fi>
pkgname=tmc-cli
pkgver=0.9.3
pkgrel=1
pkgdesc="The command-line client for University of Helsinki's TestMyCode -framework"
arch=('any')
url='https://github.com/testmycode/tmc-cli'
license=('MIT')
depends=('java-runtime>=8')
source=("https://github.com/testmycode/tmc-cli/releases/download/$pkgver/tmc-cli-$pkgver.jar"
        "tmc-cli-$pkgver.man::https://raw.githubusercontent.com/testmycode/tmc-cli/$pkgver/docs/tmc.1"
        "tmc-cli-$pkgver-autocompletion.sh::https://raw.githubusercontent.com/testmycode/tmc-cli/$pkgver/scripts/autocompletion.sh"
        "tmc-cli-$pkgver-LICENSE::https://raw.githubusercontent.com/testmycode/tmc-cli/$pkgver/LICENSE"
        tmc)
noextract=("tmc-cli-$pkgver.jar")
sha256sums=('0b1d4a01d360348db89a208fc3a67535cbe4ac85f17470782c91ccb7cf04ddbe'
            '3d25976888243d361560f9ad52472b78fb5e6c7cc91c9161896887242a8be90d'
            '2959507c6c804afbff7814428215daca53bf2827595e95af38210f8fbcd3d8eb'
            '3107dc5967527b475fd43b41283758521c7375aca79cd19fea63cb94d1fba3e6'
            '3c37cc4cea2ad5e9b41000cff7a274b3fbc1fb7785f1b4037b0bdbc6cf0c9d8e')

prepare() {
  sed -i '/alias/s/^/#/;s/\\\$/\$/g' "tmc-cli-$pkgver-autocompletion.sh"
}

package() {
  install -Dm755 "$srcdir/tmc" "$pkgdir/usr/bin/tmc"
  install -Dm644 "$srcdir/tmc-cli-$pkgver.jar" "$pkgdir/usr/share/java/tmc-cli/tmc-cli.jar"
  install -Dm644 "$srcdir/tmc-cli-$pkgver.man" "$pkgdir/usr/share/man/man1/tmc.1"
  install -Dm644 "$srcdir/tmc-cli-$pkgver-autocompletion.sh" "$pkgdir/usr/share/bash-completion/completions/tmc"
  install -Dm644 "$srcdir/tmc-cli-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

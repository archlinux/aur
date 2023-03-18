# Maintainer: AntiCompositeNumber <anticompositenumber+aur@gmail.com>
pkgname=f1multiviewer-digiflag
pkgver=2.5.0
pkgrel=1
pkgdesc="Adding a DigiFlag functionality to MultiViewer For F1"
arch=('any')
url="https://github.com/LapsTimeOFF/DigiFlag_F1MV"
license=('MIT')
depends=('f1multiviewer' 'electron' 'nodejs')
makedepends=('asar')
optdepends=()
install=
changelog=
source=(
    "$pkgname-$pkgver::https://github.com/LapsTimeOFF/DigiFlag_F1MV/releases/download/v${pkgver//_/-}/DigiFlag-F1MV-${pkgver//_/-}-linux-x64.zip"

    "f1multiviewer-digiflag.sh"
    "f1multiviewer-digiflag.desktop"
    "$pkgname.png::https://github.com/LapsTimeOFF/DigiFlag_F1MV/raw/v${pkgver//_/-}/build/icon.png"
)
b2sums=('f995a8f35615ace4e0330ca19dfd524f3a919d9d09276c8b970a01e2fc8420cac66da422a5e2166c1a0439bb7941ec844f54be51b0731a45b410327fa64d1d18'
        '996640c9866adf775cb6b8ecbb04840d29ca1ba9e4a65e69b0b99c7480b4ed28d0e55969d210aaca68b85a2f18ae0592ae30b8211d1fd291a918a7b9e8149f23'
        '8fd78bb18556365153e318fd035caba71fb6fd8706603b4467cf9ea1e510b506049c0337054e27a74bc51e6282fbf3ea4786befa349c1f00bc55298069e39b06'
        'd70b05c309fe501e068af8493a5043998353bcb9a4465580b1e1b04396c265c6273b6b5b41dd7e9a356bf671cd3cdd5cbb78aba7c91fb7fe7e21facbc3b245cc')

prepare() {
    asar extract resources/app.asar resources/app/
}

package() {
    install -Dm755 f1multiviewer-digiflag.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 f1multiviewer-digiflag.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    #cd "F1MV-DigiFlag-linux-x64"
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r resources/app/* "$pkgdir/usr/share/$pkgname/"

    install -Dm644 resources/app/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    #install -Dm644 resources/app/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

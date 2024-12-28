# Maintainer: Jerome Zago <jerome.zago@gmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=electron-shogi
pkgver=1.20.0
pkgrel=1
pkgdesc="将棋の GUI アプリです。 コンピューターとの対局や棋譜の編集・検討ができます。"
arch=('any')
url="https://github.com/sunfish-shogi/${pkgname}"
license=('MIT')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunfish-shogi/shogihome/archive/v${pkgver//_/-}.tar.gz"
    "ElectronShogi.desktop")

sha512sums=('92954df6d1a22f4c6c3f674b345b9106df7b72d9c9f17e45ea569a72834a196981d4f8e4bbb2f72150b9dce86bd491a339710bdb37020edf7bcfc72b99a7b921'
            '874e1834d3c8220a3c2772a372549a83f4c67ef7d487903d54f2b4d3f0dedcb2e70a13796a88d9d4ce1b7fa958c4a492efa586c65f9ec32851b75d5226f08978')

build() {
    cd "${srcdir}/shogihome-${pkgver}"
    npm i
    npm run electron:build
    npm run build
}

package() {
    cd "${srcdir}/shogihome-${pkgver}"
    mkdir -p "$pkgdir/opt"
    cp -r "dist/linux-unpacked" "$pkgdir/opt/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/ElectronShogi.desktop" "$pkgdir/usr/share/applications/electron-shogi.desktop"
}

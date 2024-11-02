# Maintainer: Jerome Zago <jerome.zago@gmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=electron-shogi
pkgver=1.19.0
pkgrel=1
pkgdesc="将棋の GUI アプリです。 コンピューターとの対局や棋譜の編集・検討ができます。"
arch=('any')
url="https://github.com/sunfish-shogi/${pkgname}"
license=('MIT')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunfish-shogi/${pkgname}/archive/v${pkgver//_/-}.tar.gz"
    "ElectronShogi.desktop")

sha512sums=('e7b8019af19e3a9eac5695f1ffda7564f0ded8de58867b229fd8e1e5a3e2d8ee4b2ae5e2449488c498226b6e0a581c4bc769395ce91e2aae21b51648a127f0c9'
            '874e1834d3c8220a3c2772a372549a83f4c67ef7d487903d54f2b4d3f0dedcb2e70a13796a88d9d4ce1b7fa958c4a492efa586c65f9ec32851b75d5226f08978')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm i
    npm run electron:build
    npm run build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "$pkgdir/opt"
    cp -r "dist/linux-unpacked" "$pkgdir/opt/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/ElectronShogi.desktop" "$pkgdir/usr/share/applications/electron-shogi.desktop"
}

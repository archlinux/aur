# Maintainer: Jerome Zago <jerome.zago@gmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=electron-shogi
pkgver=1.17.1
pkgrel=1
pkgdesc="将棋の GUI アプリです。 コンピューターとの対局や棋譜の編集・検討ができます。"
arch=('any')
url="https://github.com/sunfish-shogi/${pkgname}"
license=('MIT')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunfish-shogi/${pkgname}/archive/v${pkgver//_/-}.tar.gz"
    "ElectronShogi.desktop")

sha512sums=('4655324e482b20b3bf68a63b4124d853d6d66d499da7dba602f2c2de9dbc9aca970bddf8783910037f3615ff299365ced21ce8408bf2e2e48647ccf9941129fa'
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

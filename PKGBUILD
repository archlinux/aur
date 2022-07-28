# Maintainer: Gyara <laxect39@gmail.com>

pkgname=electron-shogi
pkgver=1.2.1
pkgrel=1
pkgdesc="将棋の GUI アプリです。 コンピューターとの対局や棋譜の編集・検討ができます。"
arch=('any')
url="https://github.com/sunfish-shogi/${pkgname}"
license=('MIT')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunfish-shogi/${pkgname}/archive/v${pkgver//_/-}.tar.gz"
    "ElectronShogi.desktop")

sha512sums=('509e649f12b31716559a86fe9611c6c39cfe8ae1a3401485663f5871abf743d382aa153444b5a2ada662f61f7b0ca864a451629d809e6ab0d59aafcf3555897a'
            'd3e054caee3152c60c93f9a3160b389000c09583811ea5b6fa571a13c53f9c48e4b85665d31531fba2e18d06ae9f4e40620d772c1319309f77cb803da351c6b0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm i
    npm run electron:build
    npm run build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "$pkgdir/opt"
    cp -r "dist_electron/linux-unpacked" "$pkgdir/opt/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/ElectronShogi.desktop" "$pkgdir/usr/share/applications/electron-shogi.desktop"
}

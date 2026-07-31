# Maintainer: Jerome Zago <jerome.zago@gmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=electron-shogi
pkgver=1.28.0
pkgrel=2
pkgdesc="将棋の GUI アプリです。 コンピューターとの対局や棋譜の編集・検討ができます。"
arch=('any')
url="https://github.com/sunfish-shogi/${pkgname}"
license=('MIT')
makedepends=('nodejs' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunfish-shogi/shogihome/archive/v${pkgver//_/-}.tar.gz"
    "ShogiHome.desktop")

sha512sums=('b9ed2b2530edf1924bde5c6b1e63267911d1b014929a97b92ff5d69c9328671cc4aa5fa18de4d9a063427d0b81306135379ff71c9eaac5d3d9dcfd5faafe6067'
            '00a04a1bcb9a706c2ccb2977f9da6aae583dfd287ae14a2c81c40388a71dd4fae41f6caecc4db648b371b315bcd5aafdff29c328616791245c2289b58ef32b0e')

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
    install -Dm755 "$srcdir/ShogiHome.desktop" "$pkgdir/usr/share/applications/shogi-home.desktop"
}

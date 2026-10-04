# Maintainer: Jerome Zago <jerome.zago@gmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=electron-shogi
pkgver=1.29.1
pkgrel=1
pkgdesc="将棋の GUI アプリです。 コンピューターとの対局や棋譜の編集・検討ができます。"
arch=('any')
url="https://github.com/sunfish-shogi/${pkgname}"
license=('MIT')
makedepends=('nodejs' 'npm' 'libxcrypt-compat')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunfish-shogi/shogihome/archive/v${pkgver//_/-}.tar.gz"
    "ShogiHome.desktop")

sha512sums=('13c67701118a6b15f8b12c8bdb4da70d5be7e4bee007dcb42d6150e31e9fc75a87e6d87b904a5b0a5714e9a1f78398d03fcabaf60b83ada65768fecf7c0aa43b'
            '42b29819d71c7fc1a67819fb8d1e32652dabb445ba1ae1759584d338383e7fe2ef0c5b934b83c4c0bd0401df0dcba20919b5d2430e52cbfbdafd9a429dffa278')

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
    install -Dm644 "$srcdir/ShogiHome.desktop" "$pkgdir/usr/share/applications/shogi-home.desktop"
    install -Dm644 "$srcdir/shogihome-${pkgver}/docs/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/shogihome.svg"
}

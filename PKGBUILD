# Maintainer: Jerome Zago <jerome.zago@gmail.com>
# Contributor: Gyara <laxect39@gmail.com>

pkgname=electron-shogi
pkgver=1.30.0
pkgrel=1
pkgdesc="将棋の GUI アプリです。 コンピューターとの対局や棋譜の編集・検討ができます。"
arch=('any')
url="https://github.com/sunfish-shogi/${pkgname}"
license=('MIT')
makedepends=('nodejs' 'npm' 'libxcrypt-compat')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sunfish-shogi/shogihome/archive/v${pkgver//_/-}.tar.gz"
    "ShogiHome.desktop")

sha512sums=('0842810e60bf2882de68f3e38d634dd129a5bdf307372ddb201467bc102f2b2205eb6a8f63a6ba71d85c561557448c06bf939cc6379d8d51405bae881ab6ae76'
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

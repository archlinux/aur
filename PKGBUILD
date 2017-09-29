# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=trello
pkgver=0.1.9
pkgrel=1
pkgdesc="Unofficial Trello Desktop app"
arch=(any)
url="https://github.com/danielchatfield/trello-desktop"
license=('MIT')
depends=("electron")
makedepends=("yarn")
source=("https://github.com/danielchatfield/trello-desktop/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "trello"
        "trello.desktop")
sha256sums=('8c028ee831b2deddb7b35e368540832f05d58ae9904730d0c1200ec5096cf8f2'
            'ab377d6e3babc0710c68def9c104aa9d31aea35eb35d0131594c46dbec22d7bf'
            '1c0a41f7fe942bc9ba442b84e99e345112c3037051a88aab250c5fa287b93f52')

build() {
    cd "$srcdir"/$pkgname-desktop-$pkgver
    yarn install --prod
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir"/usr/lib
    install -Dm644 $pkgname-desktop-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 $pkgname-desktop-$pkgver/static/Icon.png "$pkgdir"/usr/share/pixmaps/trello.png
    rm -rf $pkgname-desktop-$pkgver/{static,media,LICENSE}
    mv $pkgname-desktop-$pkgver "$pkgdir"/usr/lib/trello
    install -Dm755 trello "$pkgdir"/usr/bin/trello
    install -Dm644 trello.desktop "$pkgdir"/usr/share/applications/trello.desktop
}

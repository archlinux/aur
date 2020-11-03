# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='privacy-redirect'
pkgver=1.1.41
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('MIT')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm' 'unzip')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('801b5927552cf64f0f4ed7e53d3cc6a4b78bb481adbef9b38618280335368db970369fee2dc9c5523cd67d362dd26796e94b2ae60433327ee0d007eca1a8234f')

prepare() {
    npm install web-ext
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    "$srcdir/node_modules/web-ext/bin/web-ext" build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/share/$pkgname"
    unzip -d "$pkgdir/usr/share/$pkgname" "web-ext-artifacts/privacy_redirect-$pkgver.zip"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

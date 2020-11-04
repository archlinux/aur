# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='privacy-redirect'
pkgver=1.1.42
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('MIT')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm' 'unzip')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('e75ba82d8988cd14ee0fe75d4d3f48e1f9e411e5e7fedaebbcb420385705ed43756dd376ae045f15633ff1bb57eb4973210957d4ee4b66aeb51a783eff06d913')

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

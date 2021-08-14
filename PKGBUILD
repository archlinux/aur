# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname='privacy-redirect'
pkgver=1.1.49
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm' 'nodejs>=10.0.0')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('b6767e1b63cd42d21410cf277f7a203d25b14e75969c2218718069ed2462d733cec9a3666cb58fbcee5126d3c8b83f7e3c76a140c5c9212f7886672086f9008b')

prepare() {
    cd "$pkgname-$pkgver"
    npm install
    npm audit fix
}

build() {
    cd "$pkgname-$pkgver"
    npm run build
}

check() {
    cd "$pkgname-$pkgver"
    npm run test
}

package() {
    cd "$pkgname-$pkgver/web-ext-artifacts"
    install -dm755 "$pkgdir/usr/share/$pkgname"
    bsdtar -C "$pkgdir/usr/share/$pkgname" -xvf "privacy_redirect-$pkgver.zip"
}

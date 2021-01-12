# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='privacy-redirect'
pkgver=1.1.45
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm' 'nodejs>=10.0.0')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('ae01d053deee5589b64b6cd85ae79455a61a15d54df928ff10e7215548c1ef850ff1595728fe74c6d59ab60a25624f3d77580657495e43c4dbd13b373fa89168')

prepare() {
    cd "$pkgname-$pkgver"
    npm install
    npm audit fix
}

build() {
    cd "$pkgname-$pkgver"
    npm run build
}

package() {
    cd "$pkgname-$pkgver/web-ext-artifacts"
    ls

    install -dm755 "$pkgdir/usr/share/$pkgname"
    bsdtar -C "$pkgdir/usr/share/$pkgname" -xvf "privacy_redirect-$pkgver.zip"
}

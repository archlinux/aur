# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='privacy-redirect'
pkgver=1.1.46
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm' 'nodejs>=10.0.0')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('2b5f14a8657513493a456f2db63f1167e8cc5016e9c7f3e9034166c3a9ed5844abf93c3f98ba5921bc0629e004ebd84505ee33f1eb94dbbfc5f4d48a5b475ca0')

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
    ls

    install -dm755 "$pkgdir/usr/share/$pkgname"
    bsdtar -C "$pkgdir/usr/share/$pkgname" -xvf "privacy_redirect-$pkgver.zip"
}

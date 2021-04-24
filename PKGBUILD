# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='privacy-redirect'
pkgver=1.1.47
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm' 'nodejs>=10.0.0')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('293bcfb3aec279fd79e248bf26f95c1e2ccf34ada54fbc9f464dc345e67d410f11fd1b332dfdbdc79b290df252d36f1532580f52bef924d6cae2ed9a031ff501')

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

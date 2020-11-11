# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='privacy-redirect'
pkgver=1.1.43
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('MIT')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm' 'unzip')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('1dae67d1d20468a0ef3d1895e7f2b6cef09cd4c943ed02c569342d2d742e34d11ab5e869be8d53a81978cbaf8dec31059c32b3d37852153c2f62eb928de6a026')

prepare() {
    npm install web-ext
}

build() {
    "$srcdir/node_modules/web-ext/bin/web-ext" build -s "$srcdir/$pkgname-$pkgver" -i README.md LICENSE
}

package() {
    install -dm755 "$pkgdir/usr/share/$pkgname"
    unzip -d "$pkgdir/usr/share/$pkgname" "web-ext-artifacts/privacy_redirect-$pkgver.zip"

    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

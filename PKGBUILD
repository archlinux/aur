# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=3.2.0
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url="https://github.com/Nutlope/$pkgname"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
checkdepends=(git)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('fe4a4b4e0e39835d521dc6c077c076a81361b072960264a73dbffa667b4076b6beeae0e63b31a4298845863cdb42d62b4412f97cb517e0be13640a454ab14e19')

prepare() {
    cd $pkgname-$pkgver
    npm clean-install --ignore-scripts
}

build() {
    cd $pkgname-$pkgver
    npm pkg set version="$pkgver"
    npm run build
    npm pack --ignore-scripts
}

check() {
    cd $pkgname-$pkgver
    npm test
}

package() {
    cd $pkgname-$pkgver
    npm install --global --install-links --offline --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/lib/node_modules/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

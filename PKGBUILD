# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=3.1.2
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url="https://github.com/Nutlope/$pkgname"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
checkdepends=(git)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('cc341b835ae95b1a32b233d7610b2518d16e500de66bd1f10e5a8ec8f72a4fdb13bc446176795671e9b446f6c3b627539e94bb0701ca0f957757351ea94ce7f6')

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

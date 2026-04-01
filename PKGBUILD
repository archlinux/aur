# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=3.1.0
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url="https://github.com/Nutlope/$pkgname"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
checkdepends=(git)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('46ca16557688c6264e758d7bb364a5b30e73fffae14ced1ce46c4744f8fb681e4565d002ba783d7dd78ab51c4aae80bed318b9285e777ae1976beb16dcd45da6')

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

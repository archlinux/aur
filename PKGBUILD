# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=3.4.0
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url="https://github.com/Nutlope/$pkgname"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
checkdepends=(git)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('468aef616129879f020b7fc65fd517fe813dc8b7f9310284049687c28d46a06e7597d41ed3b49cc66af0a019c725d4c7302c3cf982b5935ad3b66d356aad832e')

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

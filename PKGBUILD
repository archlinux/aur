# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=2.0.0
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url="https://github.com/Nutlope/$pkgname"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
checkdepends=(git)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('c0903fa3d98ce17db901dac0d3382ed812ab3f6b78621c35e8b4d19db1ca8034e5fbf8df97ea43e0f63de3584013ba29f694a6b7c1b9b5e78b71fcc701512460')

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

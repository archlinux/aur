# Maintainer: sineptic <sineptic0@gmail.com>
pkgbase=chromium-surfingkeys
pkgname=$pkgbase-git
pkgver=f152a9a8
pkgrel=1
pkgdesc="Unpacked browser extension that provides keyboard-based navigation and control of the web in the spirit of the VIM editor"
arch=('any')
license=('MIT')
url="https://github.com/brookhong/Surfingkeys.git"
source=("surfingkeys::git+$url")
sha256sums=('SKIP')

makedepends=('git' 'npm')

pkgver() {
    cd surfingkeys
    git rev-parse HEAD | head -c 8
}

build() {
    cd surfingkeys

    npm install
    npm run build:prod
}

package() {
    mkdir -p "$pkgdir/usr/share/"

    cd "surfingkeys/dist/production/chrome"
    cp -r --no-preserve=ownership . "$pkgdir/usr/share/$pkgbase"
}

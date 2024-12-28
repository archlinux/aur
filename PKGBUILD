# Maintainer: WinStuff <justwinstuff@gmail.com>
pkgname=bsky-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc="An unofficial desktop client for Bluesky"
arch=('x86_64')
url="https://github.com/enderfoxbg/bsky"
license=('GPL3')
depends=('gtk3' 'nss' 'libxss')
makedepends=('npm' 'nodejs' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2de00ca78e52ee0979b6e4edb06a7418bad274172f69e153a6cbaf741ae1f872')

build() {
    cd "bsky-$pkgver"
    npm install
    npm run build:linux
}

package() {
    cd "bsky-$pkgver"
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname/"
    
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/bsky" "$pkgdir/usr/bin/bsky-desktop"
}
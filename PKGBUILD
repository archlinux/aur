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
source=("bsky-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "bsky-$pkgver"
    npm install
    NODE_ENV=production npm run build:linux
}

package() {
    cd "bsky-$pkgver"
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname/"
    
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/bsky" "$pkgdir/usr/bin/bsky-desktop"
}
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
sha256sums=('1aea60e41a12e2458e32ceac7ec96d49b355895a7c3e21108e8b2f14b32267b2')

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
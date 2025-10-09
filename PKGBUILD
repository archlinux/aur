# Maintainer: gao <gao66 at sdf dot org>
# Contributor: Chewing_Bever
# Contributor: Slacker

pkgname=cronicle
pkgver=0.9.95
pkgrel=1
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install="$pkgname.install"
source=("https://github.com/jhuckaby/Cronicle/archive/refs/tags/v$pkgver.tar.gz"
        "cronicle.service")
sha256sums=('2123de4ea0bb8af28a75fec0ccb546f6b9ead7abee443191fc604685ab0fd4d4'
            '62a03d25afa12fd53e3cb0a81fa8b16e6a82c2be4a8a96dd79ebb976a2705315')
backup=('opt/cronicle/conf/config.json'
        'usr/lib/systemd/system/cronicle.service')

provides=('cronicle')

prepare() {
    cd "$srcdir/Cronicle-$pkgver"
}

build() {
    cd "$srcdir/Cronicle-$pkgver"
    npm install
    node bin/build.js dist
}

package() {
    cd "$srcdir/Cronicle-$pkgver"
    install -d "$pkgdir/opt/cronicle"
    cp -a ./* "$pkgdir/opt/cronicle/"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" LICENSE.md

    rm -rf "$pkgdir/opt/cronicle/.git"
    install -Dm644 "$srcdir/cronicle.service" "$pkgdir/usr/lib/systemd/system/cronicle.service"
}

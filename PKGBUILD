# Maintainer: gao <gao66 at sdf dot org>
# Maintainer: Chewing_Bever
# Contributor: Slacker

pkgname=cronicle
pkgver=0.9.61
pkgrel=1
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/jhuckaby/Cronicle/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('278819d02bc530f8ef564d8baea9f9fd302924a034f3b085a976b1042402ee6a')
backup=('opt/cronicle/conf/config.json')

prepare() {
    cd "$srcdir/Cronicle-$pkgver"
}

build() {
    cd "$srcdir/Cronicle-$pkgver"
    npm install
    node bin/build.js dist
}

check() {
    cd "$srcdir/Cronicle-$pkgver"
    npm test
}

package() {
    cd "$srcdir/Cronicle-$pkgver"
    install -d "$pkgdir/opt/cronicle"
    cp -a ./* "$pkgdir/opt/cronicle/"

    rm -rf "$pkgdir/opt/cronicle/node_modules"
    rm -rf "$pkgdir/opt/cronicle/.git"
}

post_install() {
    echo "Cronicle installed. Please review the configuration file at /opt/cronicle/conf/config.json."
}

post_upgrade() {
    echo "Cronicle upgraded. Please review the configuration file at /opt/cronicle/conf/config.json."
}
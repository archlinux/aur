# Maintainer: gao <gao66 at sdf dot org>
# Maintainer: Chewing_Bever
# Contributor: Slacker

pkgname=cronicle
pkgver=0.9.61
pkgrel=6
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install="$pkgname.install"
source=("https://github.com/jhuckaby/Cronicle/archive/refs/tags/v$pkgver.tar.gz"
        "cronicle.service")
sha256sums=('278819d02bc530f8ef564d8baea9f9fd302924a034f3b085a976b1042402ee6a'
            'c05a9ed727dd9066772d281ec8e4afc7d5a7c2e4030fd87d4230d74dbe3ea659')
backup=('opt/cronicle/conf/config.json'
        'usr/lib/systemd/system/cronicle.service')

conflicts=('cronicle-git')
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

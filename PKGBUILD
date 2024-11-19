# Maintainer: gao <gao66 at sdf dot org>

pkgname=cronicle-git
_pkgname=Cronicle
pkgver=0.9.61.r1.g48490e0
pkgrel=1
pkgdesc="A simple, distributed task scheduler and runner"
arch=('any')
url="https://github.com/jhuckaby/Cronicle"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
install="$pkgname.install"
source=("git+$url.git")
sha256sums=(SKIP)
backup=('opt/cronicle/conf/config.json')

conflicts=('cronicle')
provides=('cronicle')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"
    npm install
    node bin/build.js dist
}

package() {
    cd "$srcdir/$_pkgname"
    install -d "$pkgdir/opt/cronicle-git"
    cp -a ./* "$pkgdir/opt/cronicle-git/"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE.md

    rm -rf "$pkgdir/opt/cronicle-git/.git"
}


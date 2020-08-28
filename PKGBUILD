# Maintainer: Tony Finn <aur@tonyfinn.com>

pkgname=preserve-git
pkgver=0.2.0.r9.g43f09e2
pkgrel=1
pkgdesc="Efficiency oriented media player/jellyfin frontend"
arch=(any)
url="https://gitlab.com/tonyfinn/preserve"
license=(GPL)
makedepends=(git jq npm)
source=(git+https://gitlab.com/tonyfinn/preserve.git)
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    make node_modules
}

build() {
    cd "$srcdir/$pkgname"
    make dist
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    install -d "${pkgdir}/usr/share/webapps/preserve"

    cp -r dist/* "${pkgdir}/usr/share/webapps/preserve"
}

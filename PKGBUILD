# Maintainer: Tony Finn <aur@tonyfinn.com>

pkgname=preserve-git
pkgver=0.3.5.r0.g87156f6
pkgrel=1
pkgdesc="Efficiency oriented media player/jellyfin frontend"
arch=(any)
url="https://gitlab.com/tonyfinn/preserve"
license=(GPL)
makedepends=(git jq npm)
optdepends=(
    'caddy2: systemd unit',
    'nginx: web server config provided',
)
source=(git+https://gitlab.com/tonyfinn/preserve.git)
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/preserve"
    make preserve-ui/node_modules
}

build() {
    cd "$srcdir/preserve"
    make dist
}

pkgver() {
    cd "$srcdir/preserve"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/preserve"
    make install DESTDIR=${pkgdir} prefix=/usr
}

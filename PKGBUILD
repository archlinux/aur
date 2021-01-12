# Maintainer: Tony Finn <aur@tonyfinn.com>

pkgname=preserve
pkgver=0.5.0
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
conflicts=('preserve-git')
source=("preserve-${pkgver}::git+https://gitlab.com/tonyfinn/preserve.git?signed#tag=v${pkgver}")
sha256sums=("SKIP")
validpgpkeys=("E31879C464DF3ED9532A50BA381C260255E413FD")

prepare() {
    cd "$srcdir/preserve-${pkgver}"
    make preserve-ui/node_modules
}

build() {
    cd "$srcdir/preserve-${pkgver}"
    make dist
}

package() {
    cd "$srcdir/preserve-${pkgver}"
    make install DESTDIR=${pkgdir} prefix=/usr
}

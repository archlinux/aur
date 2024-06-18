# Maintainer: Lukas Waymann <io@meribold.org>

pkgname=elles-git
pkgver=0.1.0.r12.g7a54d93
pkgrel=1
pkgdesc='A nicer /bin/ls'
arch=(x86_64)
url=https://github.com/arp242/elles
license=(MIT)
depends=(glibc)
makedepends=(git)
provides=(elles)
conflicts=(elles)

source=(git+https://github.com/arp242/elles.git)
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/elles" || return
    git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
    go -C elles build
}

package() {
    cd elles || return
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D elles "$pkgdir/usr/bin/elles"
}

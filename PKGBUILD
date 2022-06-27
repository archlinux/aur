# Maintainer: MicrochipQ <microchipq@gmail.com>

pkgname=tinywl-git
pkgver=0.15.0.r291.gc20468cfa
pkgrel=1
license=(custom:MIT)
pkgdesc='TinyWL'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=("tinywl=${pkgver%%.r*}")
conflicts=(tinywl)
depends=(wlroots-git)
makedepends=(git make wayland-protocols)
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd $srcdir/$pkgname/tinywl
    make
}

package() {
    cd $srcdir/$pkgname/tinywl
    install -Dm755 tinywl $pkgdir/usr/bin/tinywl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

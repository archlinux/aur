# Maintainer: Milan Šťastný <milan@stastnej.ch>

pkgname=eam-git
pkgver=3.9.2.r0.gb5859cc
pkgrel=1
pkgdesc='Epic Asset Manager used to manage assets from Epic Games Store'
url='https://github.com/AchetaGames/Epic-Asset-Manager'
license=(MIT)
arch=(x86_64)
makedepends=(git cargo rust meson gettext pkgconf)
depends=(gtk4 libadwaita dbus openssl)
options=(!lto)
provides=(eam)
conflicts=(eam)
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    arch-meson Epic-Asset-Manager build
    meson compile -C build
}

pkgver() {
    cd "Epic-Asset-Manager"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 "Epic-Asset-Manager"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

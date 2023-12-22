# Maintainer: Milan Šťastný <milan@statnej.ch>

pkgname=eam-git
pkgver=3.8.4.r8.ga8cc879
pkgrel=2
pkgdesc='Epic Asset Manager used to manage assets from Epic Games Store'
url='https://github.com/AchetaGames/Epic-Asset-Manager'
license=(MIT)
arch=(x86_64)
makedepends=(git cargo rust meson)
depends=(gtk4 libadwaita)
options=(!lto)
provides=(eam)
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

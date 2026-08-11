#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=appmenu-gtk-module-wayland
pkgver=26.08.03
pkgrel=1
pkgdesc="GTK3 global menu on plasma wayland."
arch=('x86_64' 'aarch64')
url=https://github.com/guiodic/appmenu-gtk-module-wayland
license=('LGPL-3.0-only')
depends=(libdbusmenu-gtk3)
makedepends=(cmake)
optdepends=(
  kwayland
)

source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('SKIP')

build() {
    cd "$pkgname-${pkgver}"
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/-Wl,-z,now/}"
    cmake -B build .
    cmake --build build
}

package() {
    cd "$pkgname-${pkgver}"
    install -D build/libappmenu-gtk-module-wayland.so $pkgdir/usr/lib/gtk-3.0/modules/libappmenu-gtk-module-wayland.so
    install -Dm755 ${pkgname}.sh $pkgdir/etc/profile.d/${pkgname}.sh
}

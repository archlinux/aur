#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=appmenu-gtk-module-wayland
pkgver=0.0.1
pkgrel=3
pkgdesc="GTK3 global menu on plasma wayland."
arch=('x86_64' 'aarch64')
url=https://github.com/guiodic/appmenu-gtk-module-wayland
license=('GPL-3.0-only')
depends=(libdbusmenu-gtk3)
makedepends=(cmake)
optdepends=(
  kwayland
)

source=(
  "${url}/archive/refs/heads/master.tar.gz"
)
sha256sums=('f6b9d0c5943d01642bbffad37fe8248f0408c77630bc453db0f136ffa23206ec')

build() {
    cd "$pkgname-master"
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/-Wl,-z,now/}"
    cmake -B build .
    cmake --build build
}

package() {
    install -D $pkgname-master/build/libappmenu-gtk-module-wayland.so $pkgdir/usr/lib/gtk-3.0/modules/libappmenu-gtk-module-wayland.so
    install -Dm755 $pkgname-master/${pkgname}.sh $pkgdir/etc/profile.d/${pkgname}.sh
}

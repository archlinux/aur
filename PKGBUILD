#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=appmenu-gtk-module-wayland
pkgver=0.0.1
pkgrel=1
pkgdesc="GTK3 global menu on plasma wayland."
arch=('x86_64' 'aarch64')
url=https://github.com/guiodic/appmenu-gtk-module-wayland
license=('GPL-3.0-only')
depends=(libdbusmenu-gtk3)
makedepends=(cmake)
optdepends=(
  kwayland
)
options=('!lto')

source=(
  "${url}/archive/refs/heads/master.tar.gz"
)
sha256sums=('f24cacb717bc8e1db72e801fccaede1934f87b6199d9a659b3fb8353c797b65c')

build() {
    cd "$pkgname-master"
    cmake -B build .
    cmake --build build
}

package() {
    install -D $pkgname-master/build/libappmenu-gtk-module-wayland.so $pkgdir/usr/lib/gtk-3.0/modules/libappmenu-gtk-module-wayland.so
    install -Dm755 $pkgname-master/${pkgname}.sh $pkgdir/etc/profile.d/${pkgname}.sh
}

# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls-git
pkgver=0.1.4.r1.gd18bd0f
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(i686 x86_64 armv7h aarch64)
url="https://source.puri.sm/Librem5/calls"
license=(GPL3)
depends=(folks
         gom
         gsound
         libhandy
         libpeas
         modemmanager)
makedepends=(git
             gobject-introspection
             meson
             vala)
provides=(calls)
conflicts=(calls)
source=("git+https://source.puri.sm/Librem5/calls.git")
md5sums=(SKIP)

pkgver() {
    cd calls
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson calls build -Dtests=false
    ninja -C build
}

# check() {
#     ninja -C build test
# }

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}

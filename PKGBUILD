# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgbase=popsicle-git
pkgname=(popsicle-cli-git popsicle-gtk-git)
pkgver=latest
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/${_pkgbase}"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)

provides=(popsicle-cli-git popsicle-gtk-git)
conflicts=(popsicle-cli-git popsicle-gtk-git)
makedepends=(rust cargo)

source=("git+https://github.com/pop-os/popsicle.git")
sha256sums=('SKIP')

pkgver() {
    cd popsicle
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build_popsicle-cli-git() {
    cd popsicle
    make cli
}
build_popsicle-gtk-git() {
    makedepends=(gtk3)
    
    cd popsicle
    make gtk
}

package_popsicle-cli-git() {
    pkgdesc="Command-line interface for flashing multiple USB devices in parallel, written in Rust"
    
    cd popsicle
    DESTDIR="${pkgdir}" make install-cli default_prefix="/usr"
}
package_popsicle-gtk-git() {
    pkgdesc="GTK app for flashing multiple USB devices in parallel, written in Rust"

    cd popsicle
    DESTDIR="${pkgdir}" make install-gtk default_prefix="/usr"
}

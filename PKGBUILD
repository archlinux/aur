# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgbase=popsicle-git
pkgname=(popsicle-cli-git popsicle-gtk-git)
pkgver=0.1.5.r128.gd6c8f6e
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)

makedepends=(rust cargo help2man gtk3)

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
    cd popsicle
    make gtk
}

package_popsicle-cli-git() {
    pkgdesc="CLI utility for flashing multiple USB devices in parallel, written in Rust"
    provides=(popsicle-cli)
    conflicts=(popsicle-cli)
    
    cd popsicle
    DESTDIR="${pkgdir}" prefix="/usr" make install-cli
}
package_popsicle-gtk-git() {
    pkgdesc="GTK app for flashing multiple USB devices in parallel, written in Rust"
    provides=(popsicle-gtk)
    conflicts=(popsicle-gtk)

    cd popsicle
    DESTDIR="${pkgdir}" prefix="/usr" make install-gtk
}

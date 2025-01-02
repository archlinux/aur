# Maintainer: Aryan Kadole aryankadole95@gmail.com 

pkgbase=seriot-git
pkgname=(seriot-git)
pkgver=0.1.0
pkgrel=0
pkgdesc="A Gtk4 serial monitor and plotter"
arch=($CARCH)
url="https://github.com/ak1932/seriot"
license=('GPL3')
groups=()
replaces=()
makedepends=(
    meson
    ninja
    pkgconf

    vala
)

depends=(
    gtk4
    libadwaita
    glib2
    libgee
    cairo
)

checkdepends=()
optdepends=()
source=("seriot-beta.tar.gz::${url}/archive/refs/tags/beta.tar.gz")
sha256sums=('79ad83b1db3bddaad93869005a1665c5849a6590e423ea61b1f02ea580f70ad2')
options=()

build() {
    cd "${srcdir}/seriot-beta/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    meson setup --prefix=/usr --libdir=lib --buildtype=plain "${srcdir}/seriot-beta/build"
    meson compile -C "${srcdir}/seriot-beta/build" 
}

package() {
    meson install -C "${srcdir}/seriot-beta/build" --destdir "$pkgdir"
}

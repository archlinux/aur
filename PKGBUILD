# Maintainer: Frechdachs

_pkgname=mpvqc-gtk
pkgname=${_pkgname}-git
pkgver=v1.0.2.g7713a1c
pkgrel=1
pkgdesc="mpvQC is a libmpv based application for the creation of quality control reports of video files. (GTK version)"
arch=('any')
url="https://github.com/mpvqc/mpvQC-gtk"
license=('AGPL3')
depends=('mpv'
         'python'
         'python-glfw'
         'python-gobject'
         )
makedepends=('git'
             'meson'
             )
provides=("$_pkgname" "mpvqc")
conflicts=("$_pkgname" "mpvqc")
source=("$_pkgname::git+https://github.com/mpvqc/mpvQC-gtk.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$(git describe --long --tags | tr - .)"
}

prepare() {
    mkdir -p build
}

build() {
    arch-meson build $_pkgname
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install

    cd "$_pkgname"
    install -Dm644 Readme.md "$pkgdir/usr/share/doc/$_pkgname/Readme.md"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}

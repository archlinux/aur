# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phosh
pkgver=0.4.0
pkgrel=1
pkgdesc="A pure Wayland shell prototype for GNOME on mobile devices"
url="https://source.puri.sm/Librem5/phosh"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=('feedbackd'
         'libhandy'
         'phoc')
makedepends=('ctags'
             'git'
             'meson'
             'vala')
source=("git+https://source.puri.sm/Librem5/phosh.git#tag=v${pkgver}"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd phosh

    git submodule init
    git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
    git submodule update
}

build() {
    arch-meson phosh build # -Dtests=false
    ninja -C build
}

# check() {
#     meson test -C build --print-errorlogs
# }

package() {
    DESTDIR="${pkgdir}" meson install -C build
}

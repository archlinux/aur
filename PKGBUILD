# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=wordbook
_author=fushinari
_gitname=wordbook
pkgver=0.2.0
pkgrel=1
pkgdesc='An offline dictionary app for GNOME'
arch=(any)
url=https://github.com/fushinari/Wordbook
license=(GPL3)
depends=(
    espeak-ng
    gtk3
    libhandy
    python
    python-gobject
    python-wn
)
makedepends=(
    gobject-introspection
    meson
)
source=("$_gitname-v$pkgver.tar.gz::https://github.com/$_author/$_gitname/archive/$pkgver.tar.gz")
sha256sums=('5df0441728114b26a5e586d7e42d3773dae41e0f1bdeb9380d1330fdf1aa3443')

prepare() {
    cd $_gitname-$pkgver
    cd ..
}

build() {
    arch-meson $_gitname-$pkgver build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}

# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=wordbook
_author=fushinari
_gitname=wordbook
pkgver=0.3.0
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
sha256sums=('528b4454fc0cef7b4edcdd6dec6bab6e450c4abbfd1cedad9325fba939c109ed')

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

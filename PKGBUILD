# Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=wordbook
_author=fushinari
_gitname=Wordbook
pkgver=0.3.1
pkgrel=2
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
sha256sums=('0fe8ae1c518a852dc58f0e551a9e93d836fd2089e6f42740814f9c8d18108836')

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

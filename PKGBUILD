# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=kotoba
pkgver=0.1.0
pkgrel=1
pkgdesc="Japanese–English dictionary"
arch=(x86_64)
url="https://gitlab.gnome.org/haydn/kotoba"
license=('GPL-3.0-or-later')
depends=(libadwaita)
makedepends=(appstream git cargo meson)
source=("git+${url}.git#tag=$pkgver")
b2sums=('dc6cd1c36bf2d8b5e96a60de64c1edd7b97a386e98349a5a05f1ac4c508ed7568c02fc344084cd7df723c6adf525095568ec52b7178e5b3b31370fbcb5a63530')

build() {
    arch-meson $pkgname build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}

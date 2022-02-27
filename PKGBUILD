# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Mufeed Ali <lastweakness@tuta.io>

pkgname=wordbook
_gitname=Wordbook
pkgver=0.3.1
pkgrel=3
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
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("${url}/archive/${pkgver}.tar.gz")
b2sums=('94c079dcd3ab65736c189943db18c5fabfe5dd74dcac8b99a7c32832486d1421ac1ea3305269a2195771589b15c164395fe3fd8a8cd09c0b0809a0d317232cd0')

build() {
  arch-meson $_gitname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

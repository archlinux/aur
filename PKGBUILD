# Maintainer: Ataberk Özen <ataberkozen123@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

# This pkg should be renamed to nautilus-python. Currently it's nothing but confusing.
_pkgbase=nautilus-python
_pkgname=python-nautilus
pkgname=$_pkgname-gtk4
pkgver=4.0
pkgrel=0.1
pkgdesc="Python bindings for the Nautilus Extension API"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/NautilusPython"
license=(GPL2)
depends=(nautilus python-gobject)
makedepends=(meson git gtk-doc)
provides=(python-nautilus)
conflicts=(python-nautilus)
_commit=cec007e8b159ff2225a23229adaf8b0fee80dca2  # tags/4.0^0
source=("git+https://gitlab.gnome.org/GNOME/nautilus-python.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgbase
}

build() {
  arch-meson $_pkgbase build \
    -D docs=enabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_python-nautilus-gtk4() {
  meson install -C build --destdir "$pkgdir"
}

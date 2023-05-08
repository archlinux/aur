# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>

_pkgname="sushi"
pkgname="${_pkgname}-git"
pkgver=43.0+11+gf1ad337
pkgrel=1
pkgdesc="A quick previewer for Nautilus"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
arch=(x86_64)
license=(GPL2)
depends=('gtk4' 'gjs' 'libmusicbrainz5' 'webkit2gtk' 'gtksourceview4' 'evince'
         'gst-plugins-base-libs')
makedepends=('gobject-introspection' 'git' 'meson')
optdepends=('libreoffice: OpenDocument formats')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:

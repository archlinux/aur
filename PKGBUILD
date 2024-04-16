# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=app-icon-preview
pkgver=3.4.0
pkgrel=1
pkgdesc='Tool for designing applications icons'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/World/design/app-icon-preview'
license=(GPL-3.0-or-later)
depends=('glibc' 'gcc-libs' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'graphene' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libxml2' 'pango')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream')
_commit=37b35ed3780c1b6d015b91990724d7ffed9b9c57  # tags/3.4.0^0
source=("git+https://gitlab.gnome.org/World/design/app-icon-preview.git#commit=$_commit")
b2sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

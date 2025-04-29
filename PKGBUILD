# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=nostalgia
pkgver=0.11
pkgrel=1
pkgdesc='Set historic GNOME wallpapers'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/bertob/nostalgia'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'libportal' 'libportal-gtk4')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('05e1e1e4954ee8f9d34f7d34cbb46b00ed4e69caa180a19dd93af4954f61dddf0bbf891aa120f5cdec250a6532eb204707faf5f65145a1323d9f1ac25972a455')

build() {
  arch-meson --prefix /usr "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="${pkgdir}"
}


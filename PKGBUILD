# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=randomgtk
_pkgname=random
pkgver=1.5
pkgrel=2
pkgdesc="A randomization app for GNOME"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/foreverxml/random"
license=('AGPL3')
depends=('libadwaita>=1:1.2.0')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('60424c05e57920c483fd4e9cb49cf4b147a9f624520d58ae2b1c65c3a496e817e90c9cfcbafa557b0ec2486169663913fc49030ac3f3409cc85dd686efb62444')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

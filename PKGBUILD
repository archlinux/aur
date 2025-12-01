# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=pinit
pkgver=2.2.0
pkgrel=1
pkgdesc="Pin portable apps to the launcher"
arch=('x86_64')
url="https://github.com/ryonakano/pinit"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'gtk4' 'dconf' 'libgee' 'libadwaita' 'hicolor-icon-theme' 'appstream' 'desktop-file-utils')
makedepends=('gettext' 'meson' 'vala' 'blueprint-compiler')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c4ee73d22c9dd1fd136e0555969864024a4381ab907a53d43a668dd3d92e8499')


build() {
   arch-meson "${srcdir}/${pkgname}-${pkgver}" build
   meson compile -C build
}

check() {
   meson test -C build --print-errorlogs
}

package() {
   meson install -C build --destdir "${pkgdir}"

   cd "${srcdir}/${pkgname}-${pkgver}/"

   install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
   install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

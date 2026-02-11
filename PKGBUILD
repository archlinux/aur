# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=pinit
pkgver=2.2.1
pkgrel=1
pkgdesc="Pin portable apps to the launcher"
arch=('x86_64')
url="https://github.com/ryonakano/pinit"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'gtk4' 'dconf' 'libgee' 'libadwaita' 'hicolor-icon-theme' 'appstream' 'desktop-file-utils')
makedepends=('gettext' 'meson' 'vala' 'blueprint-compiler')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('73b67a4acc37a15b8e135eb6494e83d8ec0f34ef5a6685a5de5db59860eb775a')


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

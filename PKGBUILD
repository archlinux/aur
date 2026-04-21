# Maintainer: Steven Deobald <sdeobald@gnome.org>
pkgname=savebutton
pkgver=0.2.25
pkgrel=1
pkgdesc='Simple bookmark manager'
arch=('x86_64')
url='https://github.com/lofimx/savebutton-gtk'
license=('AGPL-3.0-only')
depends=('gjs' 'gtk4' 'libadwaita' 'libsecret')
makedepends=('meson' 'ninja' 'nodejs' 'npm' 'gettext' 'glib2' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lofimx/savebutton-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b82804721172bb29f28cee5ed25117798814a4e0605a0faa41bc4ec57b300fbc')

build() {
  cd "savebutton-gtk-${pkgver}"
  npm install --include=dev
  export PATH="$PWD/node_modules/.bin:$PATH"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "savebutton-gtk-${pkgver}"
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

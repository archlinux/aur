# Maintainer: Steven Deobald <sdeobald@gnome.org>
pkgname=savebutton
pkgver=0.2.18
pkgrel=1
pkgdesc='Simple bookmark and notes manager'
arch=('x86_64')
url='https://github.com/lofimx/kaya-gtk'
license=('AGPL-3.0-only')
depends=('gjs' 'gtk4' 'libadwaita' 'libsecret' 'poppler-glib')
makedepends=('meson' 'ninja' 'nodejs' 'npm' 'typescript' 'gettext' 'glib2' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lofimx/kaya-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1730f750c8b4f7717684c1b07a713c30be824cc3075987e085f4f73e4092c495')

build() {
  cd "kaya-gtk-${pkgver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "kaya-gtk-${pkgver}"
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

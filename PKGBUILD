# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=gnome-shell-extension-shortcuts
_gitname=shortcuts-gnome-extension
pkgver=1.1.0
pkgrel=1
pkgdesc="Creates a pop-up that describes the commonly used keyboard shortcuts in GNOME Shell"
arch=('any')
url="https://gitlab.com/paddatrapper/shortcuts-gnome-extension"
license=('GPL3')
depends=('gnome-shell')
makedepends=('gettext')
options=('!emptydirs')
install=${pkgname}.install
source=("https://gitlab.com/paddatrapper/${_gitname}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('6e169ba525948e40ca924820912507a98661f7574fdab441b338cfa320c16697')

build() {
  cd "${srcdir}/${_gitname}-${pkgver}"*

  for po in locale/*/LC_MESSAGES/*.po; do
    msgfmt -cv -o ${po%.po}.mo $po;
  done
}

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"*

  _uuid='Shortcuts@kyle.aims.ac.za'

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -d "${pkgdir}/usr/share/glib-2.0/schemas"

  mv "src/schemas/org.gnome.shell.extensions.shortcuts.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp -r src/* locale "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}

# vim:set ts=2 sw=2 et:

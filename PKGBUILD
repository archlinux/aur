# Maintainer: mirandir <mirandir@orange.fr>
# Old maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rhythmbox-plugin-alternative-toolbar-git
pkgver=0.r210.fc71d3c
pkgrel=2
pkgdesc='Replace the Rhythmbox large toolbar with a Client-Side Decorated or Compact Toolbar which can be hidden'
url='https://github.com/fossfreedom/alternative-toolbar'
arch=('any')
license=('GPL3')
depends=('python-gobject' 'python-lxml' 'rhythmbox')
makedepends=('git' 'gettext')
provides=('rhythmbox-plugin-alternative-toolbar')
conflicts=('rhythmbox-plugin-alternative-toolbar')
install='rhythmbox-plugin-alternative-toolbar.install'
source=('rhythmbox-plugin-alternative-toolbar::git+https://github.com/fossfreedom/alternative-toolbar.git')
sha256sums=('SKIP')

pkgver() {
  cd rhythmbox-plugin-alternative-toolbar

  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd rhythmbox-plugin-alternative-toolbar

  install -dm 755 "${pkgdir}"/usr/{lib,share}/rhythmbox/plugins/alternative-toolbar
  install -dm 755 "${pkgdir}"/usr/share/locale
  cp -dr --no-preserve='ownership' alternative-toolbar.plugin *.py "${pkgdir}"/usr/lib/rhythmbox/plugins/alternative-toolbar/
  python -m compileall "${pkgdir}"/usr/lib/rhythmbox/plugins/alternative-toolbar
  python -O -m compileall "${pkgdir}"/usr/lib/rhythmbox/plugins/alternative-toolbar
  cp -dr --no-preserve='ownership' img ui "${pkgdir}"/usr/share/rhythmbox/plugins/alternative-toolbar/
  install -dm 755 "${pkgdir}"/usr/share/glib-2.0/schemas
  install -m 644 schema/org.gnome.rhythmbox.plugins.alternative_toolbar.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/
  
  cd po
  ./install_all.sh "${pkgdir}"/usr/share/locale/
}

# vim: ts=2 sw=2 et:

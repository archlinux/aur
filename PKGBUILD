# Maintainer: mirandir <mirandir@orange.fr>
# Old maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=rhythmbox-plugin-alternative-toolbar-git
pkgver=0.r267.f2440cd
pkgrel=1
pkgdesc='Replace the Rhythmbox large toolbar with a Client-Side Decorated or Compact Toolbar which can be hidden'
url='https://github.com/fossfreedom/alternative-toolbar'
arch=('any')
license=('GPL3')
depends=('python-gobject' 'python-lxml' 'rhythmbox')
makedepends=('git' 'gettext' 'intltool')
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
  ./autogen.sh --prefix=${pkgdir}/usr
  make
  make install
  rm ${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled
}

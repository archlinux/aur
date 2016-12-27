# Maintainer: Tobias Bohrmann (PlainTextField) <honeypot.carbage@aechelon.de>
# Contributor: Bernd Prünster (JesusMcCloud) <aur@berndpruenster.org>

pkgname=latexila
provides=('latexila')
conflicts=('latexila-git')
pkgver=3.22.1
pkgrel=1
pkgdesc="A LaTeX editor designed for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/latexila/"
license=('GPL3')
depends=('gtk3' 'gtksourceview3' 'libgee' 'gettext' 'hicolor-icon-theme'
         'gspell' 'dconf' 'gsettings-desktop-schemas')
optdepends=('yelp: for viewing help files')
makedepends=('intltool' 'itstool' 'python')
source=("http://ftp.gnome.org/pub/GNOME/sources/latexila/${pkgver%.*}/latexila-${pkgver}.tar.xz")
sha256sums=('41692d850a48521d2a700ae296680464078ef0bef1c1383383b433c5ecdf2719')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # currently not needed, but might be again in the future
  # export ac_cv_path_VALAC=""
  ./configure --prefix=/usr
  make || return 1
}
package(){
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}/" install

  mkdir -p "$pkgdir"/usr/share/{applications,pixmaps}
  install -Dm644 "data/icons/48x48/apps/latexila.png" "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -m644 data/org.gnome.$pkgname.desktop "$pkgdir"/usr/share/applications/
}

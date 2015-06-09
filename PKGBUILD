# Maintainer: Bernd Prünster <aur@berndpruenster.org>
pkgname=latexila
provides=('latexila')
conflicts=('latexila-git')
pkgver=3.16.1
pkgrel=1
install=latexila.install
pkgdesc="A LaTeX editor designed for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/latexila/"
license=('GPL3')
depends=('gtk3' 'gtksourceview3' 'libgee' 'gettext' 'hicolor-icon-theme'
         'gtkspell3' 'dconf' 'gsettings-desktop-schemas')
makedepends=('intltool' 'itstool')
source=("http://ftp.gnome.org/pub/GNOME/sources/latexila/${pkgver%.*}/latexila-${pkgver}.tar.xz")
sha256sums=('ab2d769546e10c86670e86271024c023c0a87f1b72856955c1883416a9f333f0')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # currently not needed, but might be again in the future
  # export ac_cv_path_VALAC=""
  ./configure  --prefix=/usr
  make  || return 1
}
package(){
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}/" install

  mkdir -p "$pkgdir"/usr/share/{applications,pixmaps}
  install -Dm644 "data/icons/48x48/apps/latexila.png" \
    "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -m644 data/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/
}

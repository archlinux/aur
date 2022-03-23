# $Id$
# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>
# Contributor: Mauro Fruet <maurofruet@gmail.com>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=evince-git
pkgver=42.0+9+g53f38dae
pkgrel=1
pkgdesc="Simply a document viewer"
url="http://projects.gnome.org/evince/"
arch=(x86_64)
license=(GPL)
depends=(gtk3 libgxps libspectre gsfonts poppler-glib djvulibre t1lib libsecret
         desktop-file-utils dconf gsettings-desktop-schemas adwaita-icon-theme
         gspell gnome-desktop libhandy)
makedepends=(itstool libnautilus-extension texlive-bin gobject-introspection
             docbook-xsl python gtk-doc git meson gi-docgen)
optdepends=('texlive-bin: DVI support'
	          'gvfs: bookmark support and session saving')
provides=('evince')
conflicts=('evince')
options=('!emptydirs')
source=($pkgname::"git+https://gitlab.gnome.org/GNOME/evince.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $pkgname
  arch-meson build
  ninja -C build
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" meson install -C build
}

# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gtg
pkgver=0.4.0
pkgrel=3
pkgdesc='Personal GTD like organizer for the GNOME desktop environment'
url=https://wiki.gnome.org/Apps/GTG
arch=(any)
license=(GPL)
depends=(hicolor-icon-theme python-cairo python-dbus python-gobject
         python-liblarch python-pyxdg python-lxml)
checkdepends=(python-mock python-nose)
makedepends=(meson ninja)
optdepends=('pdftk: for the export and print plugin'
            'python-cheetah3: for the export and print plugin'
			'texlive-bin: for pdflatex, needed by the export and print plugin'
			'texlive-core: for pdfjam, needed by the export and print plugin')
source=("https://github.com/getting-things-gnome/gtg/releases/download/v${pkgver%.*}/gtg-${pkgver}.tar.xz")
sha512sums=('f2677f6bbc0b6cb21b7882a2bd0342b4919581c12e4aa43c13b5dbc48740418c512a41619584d0d75bfa63ebc4a5460abfbc27360e1817c8832cbecf3c34a60e')

build ()
{
	rm -rf build
	arch-meson -Dprofile=default build "${pkgname}-${pkgver}"
	ninja -C build
}

check ()
{
	cd "${pkgname}-${pkgver}"
	./run-tests
}

package ()
{
	DESTDIR="${pkgdir}" ninja -C build install
}

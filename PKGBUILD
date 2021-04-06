# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gtg
pkgver=0.5
pkgrel=1
pkgdesc='Personal GTD like organizer for the GNOME desktop environment'
url=https://wiki.gnome.org/Apps/GTG
arch=(any)
license=(GPL)
depends=(hicolor-icon-theme python-cairo python-dbus python-gobject
         'python-liblarch>=3.1' python-pyxdg python-lxml)
checkdepends=(python-mock python-nose)
makedepends=(meson ninja)
optdepends=('pdftk: for the export and print plugin'
            'python-cheetah3: for the export and print plugin'
			'texlive-bin: for pdflatex, needed by the export and print plugin'
			'texlive-core: for pdfjam, needed by the export and print plugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getting-things-gnome/gtg/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('631f5343301d7d72211398152fa081c0fa15154babc7ec900f13a39a2677d0edaf4fea534a83284207e8019926c9108dc1d8f25bdbeae85ef0665dfe1c7b768a')

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

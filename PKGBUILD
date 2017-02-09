# Maintainer: SanskritFritz (gmail)
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@soulfly.nl>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>

# Forked from https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/gnome-python-desktop&id=69d00edc8f9b85c5dcfe8750fecd68aa77243674

pkgname=python2-rsvg
pkgver=2.32.0
pkgrel=17
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('pygtk' 'librsvg')
pkgdesc="Python bindings for librsvg"
conflicts=('python-rsvg<=2.32.0-10')
replaces=('python-rsvg<=2.32.0-10')
#makedepends=('intltool' 'pkg-config' 'gnome-python' 'libgtop' 'totem-plparser' 'gnome-desktop2' 'librsvg')
url="http://www.gnome.org"
source=("https://download.gnome.org/sources/gnome-python-desktop/2.32/gnome-python-desktop-${pkgver}.tar.bz2")
sha256sums=('09dbd580bf3b0ef60f91b090eafe6d08ddcc50a609e2b425a7f8eca46d4e0ee9')

build() {
	cd "gnome-python-desktop-$pkgver"
	PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
		--disable-gtop \
		--disable-metacity \
		--disable-evolution \
		--disable-wnck \
		--disable-gnomekeyring \
		--disable-bugbuddy \
		--disable-gnomeprint \
		--disable-gnomeprintui \
		--disable-gtksourceview \
		--disable-totem.plparser \
		--disable-nautilusburn \
		--disable-braseromedia \
		--disable-braseroburn \
		--disable-mediaprofiles \
		--disable-metacity \
		--disable-gnomedesktop \
		--disable-evolution_ecal \
		--disable-evolution \
		--disable-evince
	make
}

package() {
	cd "gnome-python-desktop-$pkgver"
	make -C rsvg install DESTDIR="${pkgdir}"
	install -m755 -d "${pkgdir}/usr/share/pygtk/2.0/defs"
	install -m644 rsvg/rsvg.defs "${pkgdir}/usr/share/pygtk/2.0/defs/"
}

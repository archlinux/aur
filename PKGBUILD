# Maintainer: Thorsten Wissmann <edu _at_ thorsten-wissmann _dot_ de>
# Contributor: Javier "Phrodo_00" Aravena <phrodo.00@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-rezlooks
pkgver=0.6
pkgrel=12
pkgdesc="Clean looking gtk theme engine based on the cairo-enabled CVS clearlooks engine code."
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php?content=39179"
license=('GPL')
depends=('gtk2')
options=('!libtool')
# the previous name was gtk-rezlooks-engine, but nowadays, all gtk engine
# packages have the prefix 'gtk-engine-'
conflicts=('gtk-rezlooks-engine')
replaces=('gtk-rezlooks-engine')
source=(
'https://dllb2.pling.com/api/files/download/id/1460970388/s/aceadbb4e25de8ca052678afea09edea81117b6c35cb3ab41d59cf84b1aa8bac866544c72c7e002daa0b9456e6b6e309c2741749929c6fc20160c19b08dcded3/t/1568913892/c/1013957f8833e596cad1e0d636468d95912ba10ef82e7dc214fec2c26363c1fe981d6cc0d928eb212755bcf5ddb77c506dfb285395da409ef2e728c7fcc382a8/lt/download/39179-rezlooks-0.6.tar.gz'
)
sha256sums=('a7dbc45ba32b8f1f40a097d7bafbdff595464c4af16a5bbb9febf63d15cab699')

prepare() {
	cd "${srcdir}/rezlooks-${pkgver}"
	./configure --prefix=/usr --enable-animation
	sed 's/glib\/gtimer/glib/g' -i src/animation.c
}

build() {
	cd "${srcdir}/rezlooks-${pkgver}"
	make
}

package() {
	cd "${srcdir}/rezlooks-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}/usr/share/themes"
}

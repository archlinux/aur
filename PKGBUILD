# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# Contrubutor: Carsten Feuls <archlinux@carstenfeuls.de> aka DL1CAF
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=grig
pkgver=0.8.1
pkgrel=5
pkgdesc="Ham Radio - Rig control (cat) program"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://groundstation.sourceforge.net/grig/"
license=('GPL')
depends=('hamlib=3.3' 'gtk2' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
provides=('grig')
conflicts=('grig-git')
source=("http://downloads.sourceforge.net/groundstation/$pkgname-$pkgver.tar.gz"
	"$pkgname.desktop")

prepare() {
	cd $srcdir/$pkgname-$pkgver

	sed -i -e "s:GtkTooltips:GtkTooltip:" src/grig-gtk-workarounds.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-vfo.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-buttons.c
	sed -i -e "s:GtkTooltips:GtkTooltip:" src/rig-gui-levels.c

	autoreconf -i
}

build(){
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=${pkgdir} install

	mkdir -p $pkgdir/usr/share/applications
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications

	cd $pkgdir/usr/share/pixmaps/grig
	cp -a $pkgname-logo.png ../.

	rm -r $pkgdir/usr/share/$pkgname
}
md5sums=('a9c0bbd58ba48d01a2fc4bcdc7bc44fc'
         'e652ce82c1fbf8ead412e978921d8025')
sha256sums=('be8687418fb23efa0468674c3fdd15340fed06eef09be9de21106cc17e033c25'
            '85941679f966eab51a5f90450447cc4b321040978287b7066f8edb1cd0bf537a')

# Maintainer: Erdal Mutlu <erdal at sisiya dot org>
pkgname=sisiyad
pkgver=0.6.31
pkgrel=1
epoch=
pkgdesc="The SisIYA daemon."
arch=('i686' 'x86_64')
url="http://www.sisiya.org"
license=('GPL2')
groups=()
depends=('sisiya-edbc-libs')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(
	'etc/sisiya/sisiyad/sisiyad.conf'
	)
options=()
install=
changelog=
#source=("$pkgname-$pkgver.tar.gz")
source=("http://sourceforge.net/projects/sisiya/files/sisiya/$pkgver/pacman/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('bed85c288b6f8680aac2dfe4ee31b8cc') #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./bootstrap create
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make "DESTDIR=$pkgdir" install

 	#mkdir -p $pkgdir/etc/systemd/system
 	install -d -m 755 $pkgdir/etc/systemd/system
	install -m 644 etc/sisiyad_systemd $pkgdir/etc/systemd/system/sisiyad.service
}

#systemctl daemon-reload
#systemctl enable sisiyad.service
#systemctl restart sisiyad
			

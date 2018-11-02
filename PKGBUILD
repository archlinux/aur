# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=openpref
pkgver=0.1.3
pkgrel=1
epoch=1
pkgdesc="OpenPref - Preference game for linux"
arch=('x86_64')
url="http://sourceforge.net/projects/openpref/"
license=('GPL3')
groups=('games')
makedepends=('cmake')
depends=('qt4')
source=("http://altlinuxclub.ru/arhiv/openpref/${pkgname}-${pkgver}.tar.gz"
 		"http://altlinuxclub.ru/arhiv/openpref/openpref.desktop" )
md5sums=('7b51607c2145f0063f405e159c6410bf'
         '095603e7fb84f081a8b2a3234fbdc4c9')

build() {
  cd "$pkgname-$pkgver"
  cmake .
  make prefix=/usr
  
}

package() {

 cd "$pkgname-$pkgver"
 make prefix=/usr DESTDIR="$pkgdir" install
 install -Dm755 openpref \
	"$pkgdir/usr/bin/openpref" 
 cd ${srcdir}
 install -D ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

}

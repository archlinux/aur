# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Shaika-Dzari <shaikadzari@gmail.com>
pkgname=fvwm-themes
pkgver=0.7.0
pkgrel=1
pkgdesc="Themes for fvwm"
arch=('any')
depends=('bash' 'perl')
url="http://fvwm-themes.sourceforge.net"
license=('GPL')
replaces=('fvwm-themes-devel')
source=("http://downloads.sourceforge.net/sourceforge/fvwm-themes/$pkgname-$pkgver.tar.bz2"
	"$pkgname.patch")
md5sums=('fca651b3f912873cc8cedf20ace1095e'
         '9a5fc1f91d34a26715eb09a5febbe8de')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -b -z .orig -i ../$pkgname.patch
}
build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man \
	--disable-build-menus \
	--disable-menu-system \
	--disable-run-updatemenu
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

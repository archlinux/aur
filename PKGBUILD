# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=konstruktor
pkgver=0.9.beta1
_pkgver=0.9-beta1
pkgrel=1
pkgdesc="A LDraw-based virtual LEGO(r) CAD for KDE 4."
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=138138"
depends=('kdebase-runtime' 'glu' 'povray' 'ldraw-parts-library')
makedepends=('cmake' 'automoc4')
install="$pkgname.install"
source=("http://konstruktor.influx.kr/$pkgname-$_pkgver.tar.bz2"
	"duplicate.patch")
license=('GPL')
md5sums=('702881530e111285968f889bffda6001'
         '9a60c645ca845399503dd320bed436c4')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -Np2 -b -z .orig <../duplicate.patch
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}

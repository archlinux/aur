pkgname=linphone-plugin-msx264
_pkgname=msx264
pkgver=1.5.2
pkgrel=2
pkgdesc="Linphone plugin that enables H.264 video codec"
url="http://www.linphone.org/"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://download-mirror.savannah.gnu.org/releases/linphone/plugins/sources/$_pkgname-$pkgver.tar.gz)
depends=('linphone')
options=('!makeflags')
md5sums=('877113f35d47b68b0ee60f934a2fee3f')
 
build() {
 
cd "$srcdir/$_pkgname-$pkgver"
 
autoreconf --force --install
./configure --prefix=/usr
 
#Fix build error
sed -i 's/-Werror//g' src/Makefile

make
}
 
package() {
 
cd "$srcdir/$_pkgname-$pkgver"
 
make PACKAGE_PLUGINS_DIR=\$\(libdir\)/liblinphone/plugins DESTDIR="$pkgdir" install
}

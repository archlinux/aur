# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive
pkgver=2.3.15
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 18+"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
makedepends=('kodi-dev' 'cmake')
depends=('kodi-platform')
conflicts=("${pkgname%-git}")
source=("https://github.com/peak3d/inputstream.adaptive/archive/${pkgver}.tar.gz")
md5sums=('cf98a561ee33d329522340fffb29b68e')


build() {
        cd "$srcdir/inputstream.adaptive-${pkgver}"
        cmake -DCMAKE_INSTALL_PREFIX=/usr .
        make
}

package() {
        cd "$srcdir/inputstream.adaptive-${pkgver}"
        make DESTDIR="$pkgdir/" install
        sed -i 's|special://home/cdm|/usr/lib/kodi/addons/inputstream.adaptive/lib|g' "$pkgdir/usr/share/kodi/addons/inputstream.adaptive/resources/settings.xml"
}

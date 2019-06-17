# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
# Contributor: kevku <kevku@gmx.com>

pkgname=kodi-addon-inputstream-adaptive
pkgver=2.3.22
_upstreamver=${pkgver}-Leia
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 18+"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
makedepends=('kodi-dev>=18' 'cmake')
depends=('kodi-platform')
conflicts=("${pkgname%-git}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/peak3d/inputstream.adaptive/archive/${_upstreamver}.tar.gz")
sha256sums=('2c21abeead9dc172de297c47930f62050f382c449682cbdb6c70c7e19a2d561b')


build() {
        cd "$srcdir/inputstream.adaptive-${_upstreamver}"
        cmake -DCMAKE_INSTALL_PREFIX=/usr .
        make
}

package() {
        cd "$srcdir/inputstream.adaptive-${_upstreamver}"
        make DESTDIR="$pkgdir/" install
        sed -i 's|special://home/cdm|/usr/lib/kodi/addons/inputstream.adaptive/lib|g' "$pkgdir/usr/share/kodi/addons/inputstream.adaptive/resources/settings.xml"
}

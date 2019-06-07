# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
# Contributor: kevku <kevku@gmx.com>

pkgname=kodi-addon-inputstream-adaptive
pkgver=2.3.20
_upstreamver=${pkgver}-Leia
pkgrel=2
pkgdesc="InputStream client for adaptive streams for Kodi 18+"
arch=('x86_64' 'i686')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
makedepends=('kodi-dev>=18' 'cmake')
depends=('kodi-platform')
conflicts=("${pkgname%-git}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/peak3d/inputstream.adaptive/archive/${_upstreamver}.tar.gz")
sha256sums=('7689921a7157f66911d235808a458db43abcc8bf4d0ebc86d7f58659df6139e8')


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

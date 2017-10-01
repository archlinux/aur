# Maintainer: Heenry78 <henry78@gmx.at>
# Contributor: ngoonee <ngoonee.talk@gmail.com>
# Contributor: Marco A Rojas <marquicus@gmail.com>
# Contributor: Corentin Rossignon <corentin.rossignon@gmail.com>
pkgname=evolution-mapi
pkgver=3.26.0
pkgrel=1
pkgdesc="MAPI plugin for evolution."
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL3')
depends=("evolution>=${pkgver}" "openchange")
makedepends=("cmake")
source=(http://ftp.gnome.org/pub/gnome/sources/evolution-mapi/${pkgver:0:4}/${pkgname}-${pkgver}.tar.xz
        auto_reconnection.patch)
sha256sums=('5312dd98f789a77ef2d514d6d1d9596770bb9566e803b3ff13db0f95a2a0ba9e'
            '9e9f6259452107195f38729b5a1c2803d95361aa3848fa9a980b2a25ca156983')

build() {
        cd ${srcdir}/${pkgname}-${pkgver}

        patch -p1 < "${srcdir}/auto_reconnection.patch"

        mkdir build
        cd build
        echo "install in $pkgdir/"
        cmake .. -DCMAKE_INSTALL_PREFIX=/usr 
        make
}

package() {
        cd ${srcdir}/${pkgname}-${pkgver}/build
        make DESTDIR="$pkgdir/" install
}

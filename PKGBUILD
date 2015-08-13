# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=libcompizconfig
pkgver=0.8.10
pkgrel=1
pkgdesc="Compiz configuration system library"
arch=('i686' 'x86_64')
url="http://www.compiz.org"
license=('GPL')
depends=('compiz-core' 'libxml2' 'libxcomposite' 'libxinerama' 'protobuf' 'startup-notification')
makedepends=('intltool' 'libxrandr' 'libice' 'libsm' 'mesa')
options=('!emptydirs')
source=("http://www.northfield.ws/projects/compiz/releases/${pkgver}/libcompizconfig.tar.gz")
sha1sums=('7e64ef43f6fca7a3770bbf8e62516be56c9c51f1')

prepare() {
    cd "${srcdir}/${pkgname}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}"
    CPPFLAGS="$CPPFLAGS -I/usr/include/compiz \
                        -I/usr/include/startup-notification-1.0 \
                        -I/usr/include/libxml2" \
                        ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}

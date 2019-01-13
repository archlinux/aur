# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="libcompizconfig"
_pkgver=0.8.16
_micro=""

pkgname=libcompizconfig
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compiz configuration system library"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=('compiz-core' 'libxml2' 'libxcomposite' 'libxinerama' 'protobuf' 'startup-notification')
makedepends=('intltool' 'libxrandr' 'libice' 'libsm' 'mesa')
options=('!emptydirs')
source=("${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2")

prepare() {
    cd "${srcdir}/${_upstream}-v${pkgver}"
}

build() {
    cd "${srcdir}/${_upstream}-v${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
    CPPFLAGS="$CPPFLAGS -I/usr/include/compiz \
                        -I/usr/include/startup-notification-1.0 \
                        -I/usr/include/libxml2" \
                        ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${_upstream}-v${pkgver}"
    make DESTDIR="${pkgdir}" install
}

sha256sums=('c08ad534ace9bab87c618ffc03f12d3dcc32a41bd173349ae7ef573ff76339fc')

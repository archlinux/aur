# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="libcompizconfig"
_pkgver=0.8.14
_micro=""

pkgname=libcompizconfig
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Compiz configuration system library"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=('compiz-core' 'libxml2' 'libxcomposite' 'libxinerama' 'protobuf' 'startup-notification')
makedepends=('intltool' 'libxrandr' 'libice' 'libsm' 'mesa')
options=('!emptydirs')
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")

prepare() {
    cd "${srcdir}/${_upstream}-${pkgver}"
}

build() {
    cd "${srcdir}/${_upstream}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
    CPPFLAGS="$CPPFLAGS -I/usr/include/compiz \
                        -I/usr/include/startup-notification-1.0 \
                        -I/usr/include/libxml2" \
                        ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${_upstream}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

sha256sums=('6952560f2ae18d36dccf01a757ea2678eb8cc1714bd6666ced0239c56e9a50e4')

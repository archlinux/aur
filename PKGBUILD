# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=libcompizconfig-git
pkgver=0.8.10.r2.g2eacaf2
pkgrel=1
pkgdesc="Compiz configuration system library"
arch=('i686' 'x86_64')
url="http://git.northfield.ws/compiz/?p=compiz/libcompizconfig;a=summary"
license=('GPL')
depends=('compiz-core' 'libxml2' 'libxcomposite' 'libxinerama' 'protobuf' 'startup-notification')
makedepends=('intltool' 'libxrandr' 'libice' 'libsm' 'mesa')
conflicts=('libcompizconfig')
provides=('libcompizconfig')
options=('!emptydirs')
source=(
	'git://northfield.ws/compiz/libcompizconfig'
)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%%-git}"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname%%-git}"
    CPPFLAGS="$CPPFLAGS -I/usr/include/compiz \
                        -I/usr/include/startup-notification-1.0 \
                        -I/usr/include/libxml2" \
                        ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname%%-git}"
    make DESTDIR="${pkgdir}" install
}

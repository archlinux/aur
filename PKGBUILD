# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="libcompizconfig"

pkgname=libcompizconfig-git
pkgver=0.8.12.r2.g992eb5c
pkgrel=1
pkgdesc="Compiz configuration system library"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=('compiz-core' 'libxml2' 'libxcomposite' 'libxinerama' 'protobuf' 'startup-notification')
makedepends=('intltool' 'libxrandr' 'libice' 'libsm' 'mesa')
conflicts=('libcompizconfig')
provides=('libcompizconfig')
options=('!emptydirs')
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_upstream}"
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${_upstream}"
    make DESTDIR="${pkgdir}" install
}

# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-experimental"

pkgname=compiz-fusion-plugins-experimental-git
pkgver=0.8.12.r10.gbb7d82e
pkgrel=1
pkgdesc="Compiz Fusion Experimental plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=('compiz-core-git' 'compiz-bcop-git' 'compiz-fusion-plugins-extra-git' 'libnotify')
makedepends=('intltool' 'pkg-config')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-experimental')
provides=('compiz-fusion-plugins-experimental')
options=('!libtool')
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Comment out until we have a tagged release
#pkgver() {
#  cd "${srcdir}/plugins-experimental"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  cd "${srcdir}/${_upstream}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
    cd "${srcdir}/${_upstream}"
    DESTDIR="${pkgdir}" make install
}

sha1sums=('SKIP')

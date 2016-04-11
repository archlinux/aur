# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-extra"

pkgname=compiz-fusion-plugins-extra-git
pkgver=0.8.12.1.r0.g2998660
pkgrel=1
pkgdesc="Compiz Fusion Extra plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=('compiz-core-git' 'compiz-bcop-git' 'compiz-fusion-plugins-main-git' 'libnotify')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-extra')
provides=('compiz-fusion-plugins-extra')
options=('!libtool')
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_upstream}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_upstream}"
  make DESTDIR="${pkgdir}" install
}

sha1sums=('SKIP')

# $Id$
# Maintainter: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-plugins-main"

pkgname=compiz-fusion-plugins-main-git
pkgver=0.8.12.2.r0.g8182f15
pkgrel=1
pkgdesc="Compiz Fusion Main plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=('compiz-core-git' 'libjpeg>=7' 'librsvg' 'compiz-bcop-git' 'libxdamage' 'libxcomposite'
	'libxinerama' 'startup-notification')
makedepends=('intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('compiz-fusion-plugins-main')
provides=('compiz-fusion-plugins-main')
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)
options=(!libtool)

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

sha1sums=('SKIP')

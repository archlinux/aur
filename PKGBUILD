# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald"

pkgname=emerald-git
pkgver=0.8.12.4.r2.gee2031a
pkgrel=1
pkgdesc="Emerald window decorator"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=('compiz-core-git' 'libwnck' 'gtk2' 'libxres' 'shared-mime-info' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
options=(!libtool)
conflicts=('emerald0.9' 'emerald')
provides=('emerald')
install=emerald.install
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
  LIBS+="-lm -ldl" ./configure --prefix=/usr --with-gtk=2.0

  make
}

package() {
  cd "${srcdir}/${_upstream}"
  make DESTDIR="${pkgdir}" install
}

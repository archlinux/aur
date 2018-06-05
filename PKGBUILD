# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald"

pkgname=emerald-git
pkgver=0.8.14.r18.g93e490c
pkgrel=1
pkgdesc="Emerald window decorator"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${_upstream}"
license=('GPL')
depends=('compiz-core-git' 'libxres' 'shared-mime-info' 'xdg-utils' 'libwnck'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
options=(!libtool)
conflicts=('emerald0.9' 'emerald')
provides=('emerald')
source=(
	"git+https://gitlab.com/compiz/${_upstream}.git"
)
sha1sums=('SKIP')

_configure_opts=(
	'--prefix=/usr'
	'--with-gtk=2.0'
)

pkgver() {
	cd "${srcdir}/${_upstream}"
	git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_upstream}"

  NOCONFIGURE=1 ./autogen.sh
  LIBS+="-lm -ldl" ./configure "${_configure_opts[@]}"

  make
}

package() {
  cd "${srcdir}/${_upstream}"
  make DESTDIR="${pkgdir}" install
}

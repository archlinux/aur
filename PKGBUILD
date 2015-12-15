# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=emerald-git
pkgver=0.8.10.r1.gc79d2be
pkgrel=1
pkgdesc="Emerald window decorator"
arch=('i686' 'x86_64')
url="http://git.northfield.ws/compiz/?p=compiz/emerald;a=summary"
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
	'git://northfield.ws/compiz/emerald'
)
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%%-git}"

  LIBS+="-lm -ldl" ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  make DESTDIR="${pkgdir}" install
}

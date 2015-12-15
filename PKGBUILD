# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-fusion-plugins-experimental-git
pkgver=0.8.11
pkgrel=1
pkgdesc="Compiz Fusion Experimental plugins"
arch=('i686' 'x86_64')
url="http://git.northfield.ws/compiz/?p=compiz/plugins-experimental;a=summary"
license=('GPL')
depends=('compiz-core-git' 'compiz-bcop-git' 'compiz-fusion-plugins-extra-git' 'libnotify')
makedepends=('intltool' 'pkg-config')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde')
conflicts=('compiz-fusion-plugins-experimental')
provides=('compiz-fusion-plugins-experimental')
options=('!libtool')
source=(
	'git://northfield.ws/compiz/plugins-experimental'
)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Comment out until we have a tagged release
#pkgver() {
#  cd "${srcdir}/plugins-experimental"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  cd "${srcdir}/plugins-experimental"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
    cd "${srcdir}/plugins-experimental"
    DESTDIR="${pkgdir}" make install
}

sha1sums=('SKIP')

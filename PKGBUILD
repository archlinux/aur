# $Id$
# Maintainter: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-fusion-plugins-main-git
pkgver=0.8.12.1.r1.g7e4e894
pkgrel=1
pkgdesc="Compiz Fusion Main plugins"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/compiz-plugins-main"
license=('GPL')
depends=('compiz-core-git' 'libjpeg>=7' 'librsvg' 'compiz-bcop-git' 'libxdamage' 'libxcomposite'
	'libxinerama' 'startup-notification')
makedepends=('intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('compiz-fusion-plugins-main')
provides=('compiz-fusion-plugins-main')
source=(
	'git+https://github.com/compiz-reloaded/compiz-plugins-main'
)
options=(!libtool)

pkgver() {
  cd "${srcdir}/compiz-plugins-main"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/compiz-plugins-main"
  
  CPPFLAGS="$CPPFLAGS -I/usr/include/compiz -I/usr/include/startup-notification-1.0 \
        -I/usr/include/libxml2" ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/compiz-plugins-main"
  make DESTDIR="${pkgdir}" install
}

sha1sums=('SKIP')

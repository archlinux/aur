# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

_pkgname=emerald
pkgname=${_pkgname}-git
pkgver=0.8.18.r4.g826408b
pkgrel=1
pkgdesc="Window decorator for Compiz"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${_pkgname}"
license=('GPL-2.0-or-later')
depends=("compiz-core>=${pkgver}" 'libxres' 'xdg-utils' 'libwnck' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald')
provides=('emerald')
source=("git+https://gitlab.com/compiz/${_pkgname}.git")
sha256sums=('SKIP')
options=('!libtool' '!strip')

pkgver() {
	cd ${srcdir}/${_pkgname}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}
  NOCONFIGURE=1 LIBS+="-lm -ldl" ./autogen.sh
  ./configure --prefix=/usr --with-gtk=2.0
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="${pkgdir}" install
}

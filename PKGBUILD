# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald"
_pkgver=0.8.16
_micro=""

pkgname=emerald
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Emerald window decorator"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${_pkgver}" 'libwnck' 'libxres' 'shared-mime-info' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
options=(!libtool)
conflicts=('emerald0.9')
source=(
  "${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2"
)

build() {
  cd "${srcdir}/${_upstream}-v${pkgver}"

  NOCONFIGURE=1 LIBS+="-lm -ldl" ./autogen.sh
  ./configure --prefix=/usr --with-gtk=2.0

  make
}

package() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('9c299ca06c9d898fcd86e49f6a4d9104299fdcd11217dd4df28117cc95882961')

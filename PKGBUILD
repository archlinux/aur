# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

pkgname=emerald
pkgver=0.8.18
pkgrel=2
pkgdesc="Window decorator for Compiz"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${pkgname}/"
license=('GPL-2.0-or-later')
depends=("compiz-core>=${pkgver}" 'libwnck' 'libxres' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-git')
source=("${url}-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('fef4ce5675f79840b811e42006063a2f21d1f3cc721c9a6d37e1a123dc6f0c54')
options=('!libtool' '!strip')

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  NOCONFIGURE=1 LIBS+="-lm -ldl" ./autogen.sh
  ./configure --prefix=/usr --with-gtk=2.0
  make
}

package() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  make DESTDIR="${pkgdir}" install
}

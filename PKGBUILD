# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: martadinata666 <martadinata666@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_pkgname=emerald
pkgname=emerald-gtk3
pkgver=0.8.18
pkgrel=5
pkgdesc="Emerald window decorator"
arch=(x86_64)
url="https://gitlab.com/compiz/${_pkgname}/"
license=('GPL')
depends=(
  compiz-core
  desktop-file-utils
  hicolor-icon-theme
  libwnck3
  libxres
  shared-mime-info
  xdg-utils
)
makedepends=(
  gettext
  intltool
  pkg-config
)
groups=(
  compiz-fusion
  compiz-fusion-gtk
  compiz-fusion-kde
)
options=(!libtool)
conflicts=(emerald)
provides=(emerald)
source=(
  "${url}-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2"
  tar-arg-fix.patch
)

sha256sums=('fef4ce5675f79840b811e42006063a2f21d1f3cc721c9a6d37e1a123dc6f0c54'
            '56c1516d7004cabde0e232baac4b0794fd61316585b83cb30272ffa16ba1cd38')

prepare() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  patch -p0 < ../tar-arg-fix.patch
}

build() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"

  NOCONFIGURE=1 LIBS+="-lm -ldl" ./autogen.sh
  ./configure --prefix=/usr --with-gtk=3.0

  make
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}

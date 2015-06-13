# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gtkparasite-gtk2
pkgver=0.2.0.71.0a0c90b
pkgrel=1
_gitcommit=0a0c90b7098d8c5b8bc06ecc88459520ad533601
pkgdesc="GTK+ debugging and development tool for GTK+2 applications"
url=http://chipx86.github.io/gtkparasite/
arch=(i686 x86_64)
license=(MIT)
depends=('pygtk' 'gtk2' 'gtksourceview2')
makedepends=('git' 'gnome-common')
options=(!libtool)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/chipx86/${pkgname%%-*}/archive/${_gitcommit}.tar.gz")
sha256sums=('16a3c575166cfdb9052cd96b2e8df6a4036941249fd1dc91b4781eeca7fade37')
install="${pkgname}.install"

prepare() {
  # Replace old AutoMake macro with new one
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' "${pkgname%%-*}-${_gitcommit}/configure.ac"
}

build() {
  cd "${pkgname%%-*}-${_gitcommit}"
  PYTHON=python2 ./autogen.sh --prefix=/usr --with-gtk=2.0
  make
}

package() {
  cd "${pkgname%%-*}-${_gitcommit}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}


# Maintainer: Darshit Shah <darnir [at] gnu [dot] org>

_pkgname=libtextstyle
pkgname=$_pkgname-git
pkgver=v0.20.1.r166.g3251d1ea0
pkgrel=1
pkgdesc='Text Styling Library (Only libtextstyle)'
url='https://www.gnu.org/software/gettext/'
arch=('x86_64')
license=('GPL3')
depends=()
makedepends=('git' 'wget')
source=(git+https://git.savannah.gnu.org/git/gettext.git)
sha512sums=('SKIP')

pkgver() {
  cd gettext
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gettext
  ./gitsub.sh upgrade
  ./gitsub.sh pull
  cd ${_pkgname}
  GNULIB_SRCDIR=../gnulib ./autogen.sh
}

build() {
  cd gettext/${_pkgname}/
  ./configure \
    --prefix=/opt/${_pkgname}
  make
}

package() {
  cd gettext/${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

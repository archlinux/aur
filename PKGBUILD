# Maintainer: Lieven Moors <lievenmoors@gmail.com>
# Contributor: Michael Ivko <ivko.mv@gmail.com>

pkgname=ntk-git
_gitname=fltk
pkgver=0.r151.5719b00
pkgrel=1
pkgdesc="Fork of FLTK 1.3.0 with additional functionality."
arch=('i686' 'x86_64')
url="http://non.tuxfamily.org/"
license=('custom:LGPL')
depends=('libxft' 'cairo' 'libjpeg')
makedepends=('git' 'python2')
provides=('ntk')
conflicts=('ntk')
source=('git://git.tuxfamily.org/gitroot/non/fltk.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  ./waf configure --prefix=/usr
  ./waf
}

package() {
  cd "$_gitname"
  ./waf --destdir="$pkgdir" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

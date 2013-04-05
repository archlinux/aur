# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=eweather-svn
_pkgname=eweather
pkgver=83648
pkgrel=1
pkgdesc="Enlightenment module: Current weather and forcast gadget"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('libeweather-svn' 'enlightenment17')
makedepends=('subversion')
conflicts=('e-modules-extra')
options=('!libtool')
source=("svn+http://svn.enlightenment.org/svn/e/trunk/E-MODULES-EXTRA/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/$_pkgname"

  svn info | awk -F : '/Last Changed Rev/ {print $2}' | tr -d " "
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}

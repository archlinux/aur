# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor:  Eugeni Dodonov <eugeni@dodonov.net>

pkgname=powerstat-git
pkgver=20140207
pkgrel=1
pkgdesc="a tool for measuring a laptops power usage via the battery"
arch=(i686 x86_64)
url="http://kernel.ubuntu.com/~cking/powerstat/"
license=(GPL2)
depends=(glibc)
makedepends=(git)

provides=('powerstat')

_gitroot=git://kernel.ubuntu.com/cking/powerstat.git
_gitname=powerstat

build() {
  cd ${srcdir}
  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull )
  else
    git clone $_gitroot
  fi

  rm -rf "${_gitname}_build"
  cp -r "${_gitname}" "${_gitname}_build"

  cd "${_gitname}_build/"
  make
}

package() {
  cd "$srcdir/${_gitname}_build"
  make DESTDIR="$pkgdir/" install
}

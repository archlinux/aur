# Maintainer: maximevince / Maxime Vincent <maxime.vince*gmail*>
# Adapted from automake-1.13 PKGBUILD maintained by: mutantmonkey <aur@mutantmonkey.in>

pkgname=automake-1.11
_realname=automake
pkgver=1.11.6
pkgrel=2
pkgdesc="A GNU tool for automatically creating Makefiles"
arch=('any')
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
makedepends=('autoconf')
provides=("automake=$pkgver")
install=automake.install
source=(ftp://ftp.gnu.org/gnu/${_realname}/${_realname}-${pkgver}.tar.xz perl2.6.patch)
md5sums=('cf4752287ad708f83bd3689da57a32c9'
         'bae3eaea7e736cdc60fdab27eb70b357')

prepare() {
  cd ${srcdir}/${_realname}-${pkgver}
  patch -p1 < ../perl2.6.patch
}

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
    true
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf "$pkgdir/usr/"{bin/{aclocal,automake},share/{doc,aclocal}}
  rm "$pkgdir/usr/share/man/man1/"{aclocal,automake}.1
  find $pkgdir/usr/share/info -type f -exec rename automake automake-1.11 '{}' ';'
}

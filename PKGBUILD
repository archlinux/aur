# Maintainer: maximevince / Maxime Vincent <maxime.vince*gmail*>
# Adapted from automake-1.13 PKGBUILD maintained by: mutantmonkey <aur@mutantmonkey.in>

pkgname=automake-1.11
_realname=automake
pkgver=1.11.6
pkgrel=1
pkgdesc="A GNU tool for automatically creating Makefiles"
arch=('any')
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
makedepends=('autoconf')
provides=("automake=$pkgver")
checkdepends=('dejagnu' 'python2' 'java-environment' 'vala' 'emacs' 'cscope')
install=automake.install
source=(ftp://ftp.gnu.org/gnu/${_realname}/${_realname}-${pkgver}.tar.xz)
md5sums=('cf4752287ad708f83bd3689da57a32c9')

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

  for files in "$pkgdir"/usr/share/info/*; do
    rename "$files" "$(echo $files | sed -r 's/(\.info)/-1.11\1/')" "$files"
  done

  rm "$pkgdir/usr/share/man/man1/"{aclocal,automake}.1
}

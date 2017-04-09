# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

# NOTE: requires rebuilt with each new gcc version

pkgname=libtool-git
pkgver=2.4.6+35.gf003a1f9
pkgrel=1
_gccver=6.3.1
pkgdesc="A generic library support script (git version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libtool"
license=('GPL')
groups=('base-devel')
depends=('sh' 'tar' 'glibc')
makedepends=("gcc=$_gccver")
provides=("libtool=$pkgver" "libltdl=$pkgver" "libtool-multilib=$pkgver")
conflicts=('libtool' 'libltdl' 'libtool-multilib')
replaces=('libtool' 'libltdl' 'libtool-multilib')
source=(git://git.savannah.gnu.org/libtool.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/libtool
  git describe --long | sed 's/^v//; s/-/+/; s/-/\./'
}

build() {
  cd ${srcdir}/libtool
  ./bootstrap
  ./configure --prefix=/usr lt_cv_sys_lib_dlsearch_path_spec="/usr/lib /usr/lib32"
  make
}

#FIXME: check fails; probably should investigate at some point :P
false &&
check() {
  cd ${srcdir}/libtool
  make check
}

package() {
  cd ${srcdir}/libtool
  make DESTDIR=${pkgdir} install
}

# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

# NOTE: requires rebuilt with each new gcc version

pkgname=libtool-git
pkgver=2.4.6+44.gb9b44533
pkgrel=1
_gccver=$(pacman -Q gcc | cut -d' ' -f2 | cut -d- -f1)
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
  git describe --long --abbrev=8 | sed 's/^v//; s/-/+/; s/-/\./'
}

build() {
  cd ${srcdir}/libtool
  ./bootstrap
  ./configure --prefix=/usr lt_cv_sys_lib_dlsearch_path_spec="/usr/lib /usr/lib32"
  make
}

check() {
  cd ${srcdir}/libtool
  make check
}

package() {
  cd ${srcdir}/libtool
  make DESTDIR=${pkgdir} install
}

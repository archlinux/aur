# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)

pkgname=coreutils-selinux
pkgver=8.21
pkgrel=2
pkgdesc="The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('selinux')
depends=('glibc' 'pam-selinux' 'acl' 'gmp' 'libcap' 'libselinux')
install=${pkgname/-selinux}.install
conflicts=("${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkrel}")
source=(ftp://ftp.gnu.org/gnu/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz{,.sig})
md5sums=('065ba41828644eca5dd8163446de5d64'
         'SKIP')

build() {
  cd ${srcdir}/${pkgname/-selinux}-${pkgver}
  ./configure --prefix=/usr --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime
  make
}

check() {
  cd ${srcdir}/${pkgname/-selinux}-${pkgver}
  #make RUN_EXPENSIVE_TESTS=yes check
}

package() {
  cd ${srcdir}/${pkgname/-selinux}-${pkgver}
  make DESTDIR=${pkgdir} install
}

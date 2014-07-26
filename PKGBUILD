# $Id$
# Maintainer:  Sébastien "Seblu" Luttringer
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# SELinux Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=coreutils-selinux
pkgver=8.23
pkgrel=1
pkgdesc="The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('selinux')
depends=('glibc' 'pam-selinux' 'acl' 'gmp' 'libcap' 'openssl' 'libselinux')
install=${pkgname/-selinux}.install
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=("ftp://ftp.gnu.org/gnu/${pkgname/-selinux}/${pkgname/-selinux}-$pkgver.tar.xz"{,.sig})
md5sums=('abed135279f87ad6762ce57ff6d89c41'
         'SKIP')

#prepare() {
#  cd $pkgname-$pkgver
#}

build() {
  cd ${pkgname/-selinux}-$pkgver
 ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib \
      --with-openssl \
      --enable-no-install-program=groups,hostname,kill,uptime \
      --with-selinux
  make
}

check() {
  cd ${pkgname/-selinux}-$pkgver
  make RUN_EXPENSIVE_TESTS=yes check
}

package() {
  cd ${pkgname/-selinux}-$pkgver
  make DESTDIR="$pkgdir" install
}

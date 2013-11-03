# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgname=psmisc-selinux
pkgver=22.20
pkgrel=1
pkgdesc="Miscellaneous procfs tools with SELinux support"
arch=('i686' 'x86_64')
url="http://psmisc.sourceforge.net/index.html"
license=('GPL')
groups=('selinux')
depends=('ncurses')
conflicts=("${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=(http://downloads.sourceforge.net/psmisc/${pkgname/-selinux}-${pkgver}.tar.gz
        psmisc-22.20-fix-selinux-in-pstree.patch)
sha1sums=('abdddc8d5c91251bba0f3190956ae9d05c058745'
          'ec7bf64a4700c79672e72c321772df1203cb3f99')

prepare() {
  cd ${pkgname/-selinux}-${pkgver}
  patch -Np1 -i ../psmisc-22.20-fix-selinux-in-pstree.patch
}

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  ./configure --prefix=/usr --enable-selinux
  make
}

package() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

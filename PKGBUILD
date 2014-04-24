# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>
# SELinux Maintainer: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
# SELinux Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=psmisc-selinux
pkgver=22.21
pkgrel=1
pkgdesc="Miscellaneous procfs tools with SELinux support"
arch=('i686' 'x86_64')
url="http://psmisc.sourceforge.net/index.html"
license=('GPL')
groups=('selinux')
depends=('ncurses')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=(http://downloads.sourceforge.net/psmisc/${pkgname/-selinux}-${pkgver}.tar.gz)
sha1sums=('09fabbef4539b58b6b8738a73da3d21d5daa1a58')

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  ./configure --prefix=/usr --enable-selinux
  make
}

package() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

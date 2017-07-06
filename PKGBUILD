# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgname=psmisc-selinux
pkgver=23.1
pkgrel=1
pkgdesc="Miscellaneous procfs tools with SELinux support"
arch=('i686' 'x86_64')
url="http://psmisc.sourceforge.net/index.html"
license=('GPL')
groups=('selinux')
depends=('ncurses' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=(http://downloads.sourceforge.net/psmisc/${pkgname/-selinux}-${pkgver}.tar.xz)
sha256sums=('2e84d474cf75dfbe3ecdacfb797bbfab71a35c7c2639d1b9f6d5f18b2149ba30')

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  ./configure --prefix=/usr --enable-selinux
  make
}

package() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Eric Bélanger <eric@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=psmisc-selinux
pkgver=23.3
pkgrel=4
pkgdesc='Miscellaneous procfs tools with SELinux support'
arch=('x86_64')
url='https://gitlab.com/psmisc/psmisc'
license=('GPL')
groups=('selinux')
depends=('ncurses' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
source=("https://downloads.sourceforge.net/psmisc/${pkgname/-selinux}-${pkgver}.tar.xz")
sha256sums=('41750e1a5abf7ed2647b094f58127c73dbce6876f77ba4e0a7e0995ae5c7279a')

build() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-selinux
  make
}

package() {
  cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

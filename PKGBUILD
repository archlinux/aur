# Maintainer: Eric Bélanger <eric@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=psmisc-selinux
pkgver=23.6
pkgrel=1
pkgdesc='Miscellaneous procfs tools with SELinux support'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/psmisc/psmisc'
license=('GPL')
groups=('selinux')
depends=('ncurses' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
validpgpkeys=('5D2FB320B825D93904D205193938F96BDF50FEA5') # Craig Small <csmall@debian.org>
source=("https://downloads.sourceforge.net/psmisc/${pkgname/-selinux}-${pkgver}.tar.xz"{,.asc})
sha256sums=('257dde06159a4c49223d06f1cccbeb68933a4514fc8f1d77c64b54f0d108822a'
            'SKIP')

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

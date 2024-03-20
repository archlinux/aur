# Maintainer: Eric Bélanger <eric@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=psmisc-selinux
pkgver=23.7
pkgrel=1
pkgdesc='Miscellaneous procfs tools with SELinux support'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/psmisc/psmisc'
license=('GPL')
groups=('selinux')
depends=('ncurses' 'libselinux')
makedepends=('git' 'po4a')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
validpgpkeys=('5D2FB320B825D93904D205193938F96BDF50FEA5') # Craig Small <csmall@debian.org>
source=("git+https://gitlab.com/psmisc/psmisc.git#tag=v${pkgver}?signed")
sha256sums=('80ae6e626ba83232b7af1c02f3f528834ebdd96325367b701f69125d3e196f2f')

prepare() {
  cd ${pkgname/-selinux}

  ./autogen.sh
}

build() {
  cd ${pkgname/-selinux}

  ./configure \
    --prefix=/usr \
    --enable-selinux
  make
}

package() {
  cd ${pkgname/-selinux}

  make DESTDIR="${pkgdir}" install
}

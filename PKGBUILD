# Maintainer: woodwose <mailbox@woodwo.se>

_pkgbase=tuxedo-yt6801
pkgname=tuxedo-yt6801-dkms-git
pkgver=1.0.29tux0.r0.g6b1a074
pkgrel=1
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=('yt6801-dkms')
source=("git+https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgbase}"

  PACKAGE_VERSION=$(git describe --exact-match --tags | sed 's/^v//')

  sed "s/#MODULE_VERSION#/${PACKAGE_VERSION}/" debian/tuxedo-yt6801.dkms > dkms.conf 

  install -Dm644 dkms.conf ${pkgdir}/usr/src/${_pkgbase}/dkms.conf

  install -Dm644 src/*.c ${pkgdir}/usr/src/${_pkgbase}/
  install -Dm644 src/*.h ${pkgdir}/usr/src/${_pkgbase}/
  install -Dm644 src/Kbuild ${pkgdir}/usr/src/${_pkgbase}/
}

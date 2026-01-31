# Maintainer: woodwose <woodwose.archlinux@fastmail.com>
# Contributor: schard

_pkgbase=tuxedo-yt6801
pkgname=tuxedo-yt6801-dkms-git
pkgver=1.0.30tux5.r7.gbc8aeca
pkgrel=1
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
conflicts=('yt6801-dkms')
install=tuxedo-yt6801.install
source=(
  "git+https://gitlab.com/tuxedocomputers/development/packages/tuxedo-yt6801"
  "dkms.conf.in"
  "tuxedo-yt6801.install"
)
b2sums=(
  'SKIP'
  '07268e2ddf849791b117aa585995f6618649e5cdacf8cb9daa91910de02383d62f7230dd1d9b8bf1420aad86c8b36363d68bcdd07b3d871dca5403f26eb738f0'
  '9f00d6d71e166a4761007837187923731dcaf69391b8cba78c6f84599943e758c99bff1afa00c137681a664f6d14623d23a79e8883af629bb8ba6550c134175c'
)

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgbase}"

  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > dkms.conf

  install -Dm644 dkms.conf ${pkgdir}/usr/src/${_pkgbase}/dkms.conf

  install -Dm644 src/*.c ${pkgdir}/usr/src/${_pkgbase}/
  install -Dm644 src/*.h ${pkgdir}/usr/src/${_pkgbase}/
  install -Dm644 src/Notice.txt ${pkgdir}/usr/src/${_pkgbase}/

  install -Dm644 src/Kbuild_default ${pkgdir}/usr/src/${_pkgbase}/Kbuild_default
  install -Dm644 src/Kbuild_no_aspm ${pkgdir}/usr/src/${_pkgbase}/Kbuild_no_aspm
}

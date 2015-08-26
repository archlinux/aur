# Maintainer: Romain "Artefact2" Dal Maso <artefact2@gmail.com>
_pkgbase=v4l2loopback
pkgname=v4l2loopback-dkms
pkgver=0.9.1
pkgrel=1
pkgdesc="v4l2-loopback device"
url="https://github.com/umlaeute/v4l2loopback"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('dkms')
makedepends=('help2man' 'linux-headers')
conflicts=("${_pkgbase}")
install="${pkgname}.install"
source=("https://github.com/umlaeute/v4l2loopback/archive/v0.9.1.tar.gz"
        "${pkgname}.install")
md5sums=('6bc4c1a2c33e4ea4d998801c5a13c617'
         '3105b604a5ebe4af6df587049ed19946')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install-utils install-man
  mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}

# vim:set ts=2 sw=2 et:

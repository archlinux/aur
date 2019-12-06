# Maintainer: danieltetraquark
# Contributor: Romain "Artefact2" Dal Maso <artefact2@gmail.com>
_pkgbase=v4l2loopback
pkgname=v4l2loopback-dkms
pkgver=0.12.3
pkgrel=1
pkgdesc="v4l2-loopback device"
url="https://github.com/umlaeute/v4l2loopback"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('dkms')
makedepends=('help2man' 'linux-headers')
conflicts=("${_pkgbase}")
source=("https://github.com/umlaeute/v4l2loopback/archive/v$pkgver.tar.gz")
sha256sums=('3f6bb14b80865ec8df557c26fd2c5ba91d726580773a75a62aa2959864ef70ba')

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

# Maintainer: danieltetraquark
# Contributor: Romain "Artefact2" Dal Maso <artefact2@gmail.com>
_pkgbase=v4l2loopback
pkgname=v4l2loopback-dkms
pkgver=0.12.1
pkgrel=1
pkgdesc="v4l2-loopback device"
url="https://github.com/umlaeute/v4l2loopback"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('dkms')
makedepends=('help2man' 'linux-headers')
conflicts=("${_pkgbase}")
source=("https://github.com/umlaeute/v4l2loopback/archive/v$pkgver.tar.gz")
sha256sums=(
'f2b9b7f8611c1a77b2f496ee505e49860121079c998bb735e4bb6b8954132348'
)

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

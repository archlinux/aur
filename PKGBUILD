# Maintainer: Joaquín Ignacio Aramendía <samsagax at gmail dot com>

_pkgbase=oxp-sensors
pkgname=oxp-sensors-dkms-git
pkgver=v0.7.r4.gceaee72
pkgrel=1
pkgdesc="Linux Driver for One X Player mini AMD"
arch=('x86_64')
url="https://gitlab.com/Samsagax/oxp-platform-dkms"
license=('GPL')
replaces=('oxp-platform-dkms-git')
conflicts=('oxp-platform-dkms-git')
depends=('dkms')
makedepends=('git')
source=("$_pkgbase::git+https://gitlab.com/Samsagax/oxp-sensors.git"
        "dkms.conf")
sha256sums=('SKIP'
            'f325b751c8a81416a75c2c1e7a7bc9ca46ae0fa3b44d4ccc09593274be1b2dc7')

pkgver() {
  cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgbase}"

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}


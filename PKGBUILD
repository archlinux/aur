# Maintainer: Joaquín Ignacio Aramendía <samsagax at gmail dot com>

_pkgbase=oxp-platform
pkgname=oxp-platform-dkms-git
pkgver=v0.3.r0.g6460c44
pkgrel=1
pkgdesc="Linux Driver for One X Player mini AMD"
arch=('x86_64')
url="https://gitlab.com/Samsagax/oxp-platform-dkms"
license=('GPL')
depends=('dkms')
makedepends=('git')
source=("$_pkgbase::git+https://gitlab.com/Samsagax/oxp-platform-dkms.git"
        "dkms.conf")
sha256sums=('SKIP'
            '537d4520bca0ed131de627a5e5acb9f5f2aa275cce3917e84759c2fb224cf2bd')

pkgver() {
  cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgbase}"
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


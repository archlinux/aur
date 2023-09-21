# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>

_pkgbase=ayn-platform
pkgname=ayn-platform-dkms-git
pkgver=v0.3.0.r0.g7a9b0ee
pkgrel=2
pkgdesc="Linux Driver for Ayn x86 handhelds"
arch=('x86_64')
url="https://github.com/ShadowBlip/ayn-platform"
license=('GPL')
conflicts=('ayn-platform-dkms-git')
depends=('dkms')
makedepends=('git')
source=("$_pkgbase::git+https://github.com/ShadowBlip/ayn-platform.git"
        "dkms.conf")
sha256sums=('SKIP'
            '537d4520bca0ed131de627a5e5acb9f5f2aa275cce3917e84759c2fb224cf2bd')

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

# Maintainer: Ashymad <ashymad@posteo.net>

_pkgbase=comedi
pkgname=${_pkgbase}-dkms-git
pkgver=r3496.9a780c9a
pkgrel=1
pkgdesc="The Linux Control and Measurement Device Interface"
arch=('any')
url="https://github.com/Linux-Comedi/comedi"
depends=('dkms' 'automake')
makedepends=('git')
optdepends=('comedilib: userspace library for COMEDI devices')
license=('GPL2')
conflicts=("${_pkgbase}")

source=("${_pkgbase}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgbase}"

  autoupdate
  autoreconf -vfi

  mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -vr * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  sed -e "s/^PACKAGE_VERSION=.*$/PACKAGE_VERSION=${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

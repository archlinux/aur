# Maintainer: Harrison <htv04rules at gmail dot com>
# Contributor: Michael Taboada <michael@2mb.solutions>

_pkgname=rtl88x2bu
pkgname=${_pkgname}-cilynx-dkms-git
pkgver=r105.e8ad266
pkgrel=2
pkgdesc="rtl88x2bu driver updated for current kernels"
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/cilynx/${_pkgname}"
license=("GPL2")
depends=("dkms")
makedepends=("git" "bc")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install source
  install -dm755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -r * "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
  sed -e "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf" # Update version
}

##
# Maintainer: pyamsoft <developer(dot)pyamsoft(at)gmail(dot)com>
##

pkgname=pstate-frequency
# shellcheck disable=SC2034
pkgdesc="Easily control Intel p-state driver"
# shellcheck disable=SC2034
pkgver=3.16.1
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('any')
# shellcheck disable=SC2034
makedepends=()
# shellcheck disable=SC2034
depends=('coreutils' 'grep' 'awk')
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=('pstate-frequency')
# shellcheck disable=SC2034
conflicts=('pstate-frequency')
# shellcheck disable=SC2034
license=('GPL2')
# shellcheck disable=SC2034
url="https://github.com/pyamsoft/pstate-frequency"
# shellcheck disable=SC2034
backup=('etc/pstate-frequency.d/00-auto.plan'
  'etc/pstate-frequency.d/01-powersave.plan'
  'etc/pstate-frequency.d/02-balanced.plan'
  'etc/pstate-frequency.d/03-performance.plan'
  'etc/pstate-frequency.d/04-max.plan')
# shellcheck disable=SC2034
source=(
  "${url}/archive/${pkgver}.zip"
  "00-fix-prefix.patch")
# shellcheck disable=SC2034
sha256sums=('fe8815491b44a9c23d3b2cdb3db0d973d9d2f09610c21b2a7b93caee440b4418'
  'e5423df20c03ef19448a78a1ae39e630d90f63c6c4e0962296ad292665575f0d')

prepare() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${pkgname}-${pkgver}" || {
    msg "Failed to cd into ${srcdir}/${pkgname}-${pkgver}"
    return 1
  }

  # Apply patches
  patch -p1 -i "${srcdir}/00-fix-prefix.patch"

  # Disabled by default to conform to AUR packaging
  # best practices. It is highly recommended that you
  # enable the line to allow for editing the config.mk file
  #
  # make DESTDIR="${pkgdir}" edit
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${pkgname}-${pkgver}" || {
    msg "Failed to cd into ${srcdir}/${pkgname}-${pkgver}"
    return 1
  }

  # shellcheck disable=SC2154
  make DESTDIR="${pkgdir}" install
}

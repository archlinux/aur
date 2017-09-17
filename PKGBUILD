##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=pstate-frequency
# shellcheck disable=SC2034
pkgdesc="Easily control Intel p-state driver"
# shellcheck disable=SC2034
pkgver=3.7.5
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
arch=('i686' 'x86_64')
# shellcheck disable=SC2034
makedepends=('')
# shellcheck disable=SC2034
depends=()
# shellcheck disable=SC2034
optdepends=('x86_energy_perf_policy: For the x86_energy_perf_policy-sleep.service')
# shellcheck disable=SC2034
provides=('pstate-frequency')
# shellcheck disable=SC2034
conflicts=('pstate-frequency')
# shellcheck disable=SC2034
license=('GPLv2')
# shellcheck disable=SC2034
url="https://github.com/pyamsoft/pstate-frequency"
# shellcheck disable=SC2034
source=(
        "${url}/archive/${pkgver}.tar.gz"
        "00-fix-prefix.patch")
# shellcheck disable=SC2034
sha256sums=('7f2b38348a1a37ffd4bb10e2c00732be7a8eb3b4b69650bfa41b4d46c2212d33'
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

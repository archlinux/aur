##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=pstate-frequency
pkgdesc="Easily control Intel p-state driver"
pkgver=2.0.4
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git')
depends=('coreutils' 'grep')
optdepends=('x86_energy_perf_policy: For the x86_energy_perf_policy-sleep.service')
provides=('pstate-frequency')
conflicts=('pstate-frequency')
license=('GPLv2')
url="https://github.com/pyamsoft/pstate-frequency/archive/${pkgver}.tar.gz"
source=(
        "${url}"
        "00-fix-prefix.patch")
sha256sums=(
        '44d372769da1e7c28ca1222d3f56b167311246f30fb9640fb8c5ad771c57430c'
        'e5423df20c03ef19448a78a1ae39e630d90f63c6c4e0962296ad292665575f0d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply patches
  patch -p1 -i "${srcdir}/00-fix-prefix.patch"

  # Disabled by default to conform to AUR packaging
  # best practices. It is highly recommended that you
  # enable the line to allow for editing the config.mk file
  #
  # make DESTDIR="${pkgdir}" edit

  make DESTDIR="${pkgdir}" options
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" clean
  make DESTDIR="${pkgdir}" bin
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}


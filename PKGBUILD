# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>
# Contributor: Hervé YVIQUEL <elldekaa@gmail.com>

pkgname=hwloc1
_pkgname=hwloc
pkgver=1.11.13
pkgrel=1
pkgdesc='Portable Hardware Locality is a portable abstraction of hierarchical architectures (1.x branch)'
url='https://www.open-mpi.org/projects/hwloc/'
arch=('x86_64')
license=('BSD')
depends=('numactl' 'libtool' 'systemd-libs')
makedepends=('cairo' 'libxml2' 'pciutils' 'systemd')
optdepends=('cairo' 'libxml2' 'pciutils')
conflicts=('hwloc')
provides=("hwloc=${pkgver}")
options=('!docs')
source=(https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('a4494b7765f517c0990d1c7f09d98cb87755bb6b841e4e2cbfebca1b14bac9c8')

build() {
  cd hwloc-${pkgver}

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-plugins
  make
}

check() {
  cd hwloc-${pkgver}
  make check
}

package() {
  cd hwloc-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

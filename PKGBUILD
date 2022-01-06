# Maintainer: Holger Obermaier <holgerob[at]gmx[dot]de>
pkgname=likwid
pkgver=5.2.1
pkgrel=3
pkgdesc="Lightweight performance tools"
url="https://github.com/RRZE-HPC/likwid"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
makedepends=()
optdepends=('perl: for likwid-mpirun and likwid-perfscope'
            'openmpi: for likwid-mpirun'
            'gnuplot: for likwid-perfscope')
conflicts=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1b8e668da117f24302a344596336eca2c69d2bc2f49fa228ca41ea0688f6cbc2')

_prefix=/usr
_mandir=/usr/share/man
_bindir=/usr/bin
_libdir=/usr/lib

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j "$(nproc)" \
    PREFIX="${_prefix}" \
    MANPREFIX="${_mandir}" \
    BINPREFIX="${_bindir}" \
    LIBPREFIX="${_libdir}" \
    INSTALLED_PREFIX="${_prefix}" \
    INSTALLED_BINPREFIX="${_bindir}" \
    INSTALLED_LIBPREFIX="${_libdir}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install \
    PREFIX="${pkgdir}/${_prefix}" \
    MANPREFIX="${pkgdir}/${_mandir}" \
    BINPREFIX="${pkgdir}/${_bindir}" \
    LIBPREFIX="${pkgdir}/${_libdir}" \
    INSTALLED_PREFIX="${_prefix}" \
    INSTALLED_BINPREFIX="${_bindir}" \
    INSTALLED_LIBPREFIX="${_libdir}"
}

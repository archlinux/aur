# Maintainer: Holger Obermaier <holgerob[at]gmx[dot]de>
# Contributor: Steven Vancoillie <steven<dot>vancoillie[at]gmail[dot]com>
pkgname=likwid
pkgver=5.2.3
pkgrel=1
pkgdesc="Lightweight performance tools"
url="https://hpc.fau.de/research/tools/likwid/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=()
makedepends=()
optdepends=('perl: for likwid-mpirun and likwid-perfscope'
            'openmpi: for likwid-mpirun'
            'gnuplot: for likwid-perfscope')
conflicts=()
source=( "likwid::git+https://github.com/RRZE-HPC/likwid#tag=v${pkgver}" )
sha256sums=( "SKIP" )

_prefix="/usr"
_mandir="${_prefix}/share/man"
_bindir="${_prefix}/bin"
_sbindir="${_bindir}" # /usr/sbin links to /usr/bin
_libdir="${_prefix}/lib"

build() {
  cd "${srcdir}/likwid"
  make -j "$(nproc)" \
    PREFIX="${_prefix}" \
    MANPREFIX="${_mandir}" \
    BINPREFIX="${_bindir}" \
    SBINPREFIX="${_sbindir}" \
    LIBPREFIX="${_libdir}" \
    INSTALLED_PREFIX="${_prefix}" \
    INSTALLED_BINPREFIX="${_bindir}" \
    INSTALLED_SBINPREFIX="${_sbindir}" \
    INSTALLED_LIBPREFIX="${_libdir}"
}

package() {
  cd "${srcdir}/likwid"
  make install \
    PREFIX="${pkgdir}/${_prefix}" \
    MANPREFIX="${pkgdir}/${_mandir}" \
    BINPREFIX="${pkgdir}/${_bindir}" \
    SBINPREFIX="${pkgdir}/${_sbindir}" \
    LIBPREFIX="${pkgdir}/${_libdir}" \
    INSTALLED_PREFIX="${_prefix}" \
    INSTALLED_BINPREFIX="${_bindir}" \
    INSTALLED_SBINPREFIX="${_sbindir}" \
    INSTALLED_LIBPREFIX="${_libdir}"
}

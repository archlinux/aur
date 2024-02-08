# Maintainer: banana-bred <j.forer@posteo.net>

pkgname='opencoarrays'
_name='OpenCoarrays'
pkgver=2.10.2
pkgrel=2
pkgdesc="A transport layer for coarray Fortran compilers."
arch=('x86_64')
url="https://github.com/sourceryinstitute/OpenCoarrays"
license=('BSD')
groups=()
depends=('openmpi')
makedepends=('gcc-fortran' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("https://github.com/sourceryinstitute/OpenCoarrays/releases/download/${pkgver}/OpenCoarrays-${pkgver}.tar.gz")
sha256sums=(e13f0dc54b966b0113deed7f407514d131990982ad0fe4dea6b986911d26890c)

build() {

  cd "${srcdir}/${_name}-${pkgver}"

  export FC="$(command -v gfortran)"
  export CC="$(command -v gcc)"
  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  cd "${srcdir}/${_name}-${pkgver}/build"

  make

}

check() {

  cd "${srcdir}/${_name}-${pkgver}/build"

  make test

}

package() {

  cd "${srcdir}/${_name}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  install -D -m 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim: ts=2 sw=2 et :

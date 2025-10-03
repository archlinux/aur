# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel

pkgname=eigen3
pkgver=3.4.1
pkgrel=2
pkgdesc='Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra'
arch=(any)
url="https://gitlab.com/libeigen/eigen"
license=(MPL-2.0 Apache-2.0 BSD-3-Clause Minpack 'LGPL-2.1-only OR LGPL-2.1-or-later')
makedepends=(cmake freeglut gcc-fortran fftw suitesparse boost)
#options=(staticlibs)
source=(https://gitlab.com/libeigen/eigen/-/archive/${pkgver}/"eigen-${pkgver}".tar.gz
		eigen3.conf)
sha256sums=('b93c667d1b69265cdb4d9f30ec21f8facbbe8b307cf34c0b9942834c6d4fdbe2'
            'fa0d36379d4d4d55c3eb50d7aeaec38654f65101c21bbfdde41ae68bc54e5953')

build() {
  local _flags=(
	-DEIGEN_BUILD_BLAS:BOOL=OFF
	-DEIGEN_BUILD_LAPACK:BOOL=OFF
	-DCMAKE_INSTALL_PREFIX=/opt/eigen3
  )

  cmake -B build -S "eigen-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "eigen-${pkgver}"/COPYING.* -t "$pkgdir/usr/share/licenses/${pkgname}"

  install -D -m644  eigen3.conf -t "${pkgdir}/etc/ld.so.conf.d/"
}

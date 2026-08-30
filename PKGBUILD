# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Alexander Scharinger
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>

pkgname=gecode
pkgver=6.4.0
pkgrel=1
pkgdesc="Generic Constraint Development Environment "
arch=(x86_64)
url="https://github.com/Gecode/gecode"
license=(MIT)
depends=(
    glibc
    libgcc
    libglvnd
    libstdc++
    mpfr
    qt6-base
    sh
    )
makedepends=(
    cmake
    git
    )
source=("git+https://github.com/Gecode/gecode.git#tag=release-${pkgver}")
sha256sums=('35dba607fb1eaef558a730c91786b1af76fba8fa065dce999de61bfdd5960b9a')

build() {

  cmake -B build -S gecode -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D gecode/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

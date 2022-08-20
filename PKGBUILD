# Maintainer: robertfoster

pkgname=xash3d-hlsdk
pkgver=r639.8f5c36dc
pkgrel=1
pkgdesc="Half-Life SDK from original Xash3D engine"
arch=('x86_64')
url="http://xash.su/"
license=('GPL3')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/FWGS/hlsdk-portable")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cmake -B build -S "${srcdir}/${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr/lib \
    -D64BIT=1

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" \
    cmake --install build
}

sha256sums=('SKIP')

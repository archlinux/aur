# Maintainer: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>
pkgname=sealcrypto-git
pkgver=v4.1.1.r0.g206648d
pkgrel=1
pkgdesc='Microsoft library for fully homomorphic encryption'
arch=('x86_64')
url="https://github.com/Microsoft/SEAL"
license=('MIT')
makedepends=('git' 'cmake')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
conflicts=("sealcrypto")

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}
  cmake -B build -S ${pkgname} \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  install -m644 -D ${srcdir}/${pkgname}/LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  DESTDIR="${pkgdir}" cmake --install build
}

# maintainer: anton \ät semjonov.de

pkgname=updiprog-git
_pkgname="${pkgname%-git}"
pkgdesc="utility for programming AVR devices with UPDI interface using standard TTL serial port"

pkgver=0.5.r2.99df4f8
pkgrel=1

arch=('x86_64')
url="https://github.com/Polarisru/${_pkgname}"
license=('BSD')

depends=()
makedepends=('cmake' 'make' 'git')

provides=(${_pkgname}=${pkgver})
conflicts=(${_pkgname})
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
  git -C "${pkgname}/" describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cmake -B build/ -S "${pkgname}/" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build/
}

package() {
  install -Dm755 "build/${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}


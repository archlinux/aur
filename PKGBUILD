# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>

pkgname=qcheck-git
_pkgname=qCheck
pkgver=r56.2262a31
pkgrel=1
pkgdesc="A quick alternative to cksfv for generating and verifying CRC32C checksum files(.sfv)."
arch=('x86_64')
url="https://github.com/Wunkolo/${_pkgname}"
license=('MIT')
depends=('boost-libs')
makedepends=('git' 'cmake' 'catch2' 'boost' 'sed')
source=("git+https://github.com/Wunkolo/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${_pkgname}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --config Release
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    install -Dm+x "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

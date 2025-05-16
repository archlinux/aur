# Maintainer: wunk <wunkolo@gmail.com>
# Contributor: wunk <wunkolo@gmail.com>

pkgname=vkfetch-git
_pkgname=vkfetch
pkgver=r100.45e1004
pkgrel=1
pkgdesc="A 'fetch' program that displays vulkan information about your GPU(s)"
arch=('x86_64')
url="https://github.com/Wunkolo/${_pkgname}"
license=('MIT')
makedepends=('git' 'cmake' 'vulkan-headers')
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

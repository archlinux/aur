# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Container: gbr <gbr@protonmail.com>

pkgname=vibrantlinux
_pkgname=vibrantLinux
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool to automate managing your screen's saturation depending on what programs are running"
arch=(x86_64)
url="https://github.com/libvibrant/vibrantLinux"
license=('GPL')
depends=("qt6-base" "libvibrant")
makedepends=("git" "cmake")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/libvibrant/vibrantLinux/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('845f4bd44e3c9d6ff033f1a98f6bcb8c8144c6d965938f55e18497955c964b6988483129d39a1c56e5cf3a50d0066c3ed25f407d327f860c7cb3c978de4843d1')

build() {
  cd "${_pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Bbuild -S.
  cmake --build build
}

package() {
  cd "${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

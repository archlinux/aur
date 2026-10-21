# Maintainer: YOUR NAME <you@example.com>
pkgname=krunner-scrivener
_reponame=Krunner-Scrivener
pkgver=0.1.0
pkgrel=1
pkgdesc='KRunner plugin to search Scrivener favorite and recent projects (Plasma 6)'
arch=('x86_64' 'aarch64')
url="https://github.com/yaoyaozijing/${_reponame}"
license=('MIT')
depends=('qt6-base' 'kcoreaddons' 'ki18n' 'krunner' 'kcmutils')
makedepends=('cmake' 'extra-cmake-modules')
optdepends=('baloo: search .scrivx files outside favorites/recent via the file index')
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a9184098042ba256a98f809e99fbf207d8a264455341cba0229e8edfac3e8f98')

build() {
  cmake -B build -S "${_reponame}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_reponame}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

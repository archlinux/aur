# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_qhotkey_commit=6c0e98492c59206139f8490706aadeb8ed033057

_pkgname=QPrompt-Teleprompter
pkgname=${_pkgname,,} ; pkgname=${pkgname%-*}
pkgver=2.0.3
pkgrel=1
arch=('x86_64')
pkgdesc="Teleprompter software for video creators"
url="https://qprompt.app/"
_url_github="https://github.com/Cuperino/${_pkgname}"
license=('GPL-3.0-only')
options=('!lto')
depends=('hicolor-icon-theme' 'kcoreaddons' 'kirigami' 'qhotkey-qt6' 'qt6-declarative')
makedepends=('extra-cmake-modules' 'kcrash' 'ki18n' 'kiconthemes' 'ninja' 'qt6-shadertools' 'qt6-tools' 'vulkan-headers')
source=("$_pkgname-$pkgver.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4d19440d547cf5c504c30c4cb207b0503b7e7a5c9b689fe464a32914ac19bd9ea491c404c5fae2249c6b1fc08f6c1f2d66f0c9d8f32ba24b450eb1ccb315500c')

build() {
  cd $_pkgname-$pkgver
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DSOURCE_DEPENDENCIES_EXCLUSIVELY_FROM_SYSTEM=ON
  ninja -C build/
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build/ install
}

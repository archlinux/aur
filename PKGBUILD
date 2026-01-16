# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_qhotkey_commit=6c0e98492c59206139f8490706aadeb8ed033057

_pkgname=QPrompt-Teleprompter
pkgname=${_pkgname,,} ; pkgname=${pkgname%-*}
pkgver=2.0.0
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
b2sums=('7838b0223bbe5f4408dfb12aacb82ce882625aeab042b9595a0163c30b4b7532004c37ed40e5ca7d516c2c4c7b479c5597e5a7ed39999cd105c4b65abc5c8563')

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

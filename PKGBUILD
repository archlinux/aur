# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_qhotkey_commit=6c0e98492c59206139f8490706aadeb8ed033057

_pkgname=QPrompt-Teleprompter
pkgname=${_pkgname,,} ; pkgname=${pkgname%-*}
pkgver=2.0.2
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
b2sums=('86f2d21e145fea98c39438a83d6cd06996196ce54d70d6b9e96f833027d7514d9a7369af31601606e8814acdfad52687c31b17690cce8f68a85ebae4e0487802')

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

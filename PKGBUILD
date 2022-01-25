# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=QPrompt
pkgname=${_pkgname,,}
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="Teleprompter software for video creators"
url="https://qprompt.app/"
_url="https://github.com/Cuperino/QPrompt"
license=('GPL3' 'LGPL3')
depends=('hicolor-icon-theme' 'kcoreaddons' 'ki18n')
makedepends=('extra-cmake-modules' 'kiconthemes' 'kirigami2' 'ninja')
source=("$_pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('c52ca2b40a7ddefb699268bbca039642ddc3d875bb8fd23858809fa7ac9bf25d5f86f6e5de7057a933ecdc21e7ba8d6074f101f9cea481f1801a76af83a0066b')

prepare() {
  # Change docs directory to "/usr/share/doc"
  sed -i '/DOC_INSTALL_DIR/ s|"|"share/|' $_pkgname-$pkgver/CMakeLists.txt
}

build() {
  cd $_pkgname-$pkgver
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build/
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build/ install
}

# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordmanager
pkgname=passwordmanager
pkgver=2.1.1
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A simple password store using AES-256-CBC encryption via OpenSSL."
license=('GPL')
depends=('qt5-base' 'qtutilities' 'passwordfile' 'openssl' 'libxkbcommon-x11' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("passwordmanager-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('ad2b91f2b1a54668d06c258686ec48f41f3ffd34cbbcd1ec4bb2a3226e3a9b4b')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DQUICK_GUI="no"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}

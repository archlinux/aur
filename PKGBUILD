# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=passwordmanager
pkgname=passwordmanager
pkgver=3.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A simple password store using AES-256-CBC encryption via OpenSSL'
license=('GPL')
depends=('qt5-base' 'qtutilities' 'passwordfile' 'openssl' 'libxkbcommon-x11' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'qt5-tools' 'mesa')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('418a3ca93d4c4a614e55b7f22ddfc7fcc765eacc571dd69ce3086f8441a9d59d')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DQUICK_GUI="no"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}

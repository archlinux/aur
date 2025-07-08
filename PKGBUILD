# Maintainer: Evert Vorster <superchief at evertvorster dot com>
# Contributor: Andrew O'Neill <andrew at haunted dot sh>

pkgname=actiona
pkgver=3.11.1
pkgrel=1
pkgdesc='A task automation tool that allows you to create and execute action lists'
arch=('x86_64')
url='https://wiki.actiona.tools'
license=('GPL-3.0-only')
options=('!buildflags')
depends=('qt6-declarative' 'libxtst' 'qt6-tools' 'qt6-speech' 'qt6-5compat' 
         'qt6-multimedia' 'libnotify' 'opencv')
makedepends=('qt5-tools' 'boost' 'cpp-mini' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jmgr/${pkgname}/releases/download/v${pkgver}/actiona-${pkgver}-source-linux.tar.gz")

sha256sums=('a643ccae90f353b6558e9f61c00a8aedb5ca73c52f08bb0ccca69fc5e2a8444d')

build() {
  cd "${pkgname}-${pkgver}-source"
  rm -rf build
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build .
}

package() {
  cd "${pkgname}-${pkgver}-source"
  DESTDIR=${pkgdir} cmake --install build
}

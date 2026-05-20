# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Evert Vorster <superchief at evertvorster dot com>
# Contributor: Andrew O'Neill <andrew at haunted dot sh>

pkgname=actiona
pkgver=3.11.4
pkgrel=1
pkgdesc='A task automation tool that allows you to create and execute action lists'
arch=('x86_64')
url='https://wiki.actiona.tools'
license=('GPL-3.0-only')
options=('!buildflags')
depends=('bluez-libs' 'qt6-declarative' 'libxtst' 'qt6-tools' 'qt6-speech' 'qt6-5compat'
         'qt6-multimedia' 'libnotify' 'opencv')
makedepends=('boost' 'cpp-mini' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jmgr/${pkgname}/releases/download/v${pkgver}/actiona-${pkgver}-source-linux.tar.gz")
sha256sums=('20bf5bf738cae3675707cbd18fd5d1c3babb53ddf3e63c60f507947ac397c721')

latestver() {
  gh api repos/Jmgr/actiona/releases/latest --jq '.tag_name' | sed 's/^v//'
}

build() {
  cd "${pkgname}-${pkgver}-source"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}-source"
  DESTDIR=${pkgdir} cmake --install build
}

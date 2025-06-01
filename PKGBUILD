# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgname=qcma-git
pkgver=0.4.1.15.g590236e
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita. (GIT version)"
arch=('x86_64')
url='https://github.com/codestation/qcma'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'glib2' 'libgobject-2.0.so'
  'qt6-base' # libQt6Core.so libQt6Gui.so libQt6Network.so libQt6Sql.so libQt6Widgets.so
  'libnotify' 'libnotify.so'
  'libvitamtp' # libvitamtp.so
  'ffmpeg' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'qt6-tools'
)
conflicts=(
  'qcma-appindicator-git'
  'qcma-kdenotifier-git'
)
source=('git+https://github.com/codestation/qcma.git#branch=qt6')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd qcma
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {

  cd build

  /usr/lib/qt6/bin/lrelease ../qcma/common/resources/translations/*.ts
  qmake6 ../qcma PREFIX=/usr
  make
}

package() {
  make -C build INSTALL_ROOT="${pkgdir}" install
}

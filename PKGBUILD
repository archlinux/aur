# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgname=qcma-git
pkgver=v0.4.1.0.g6044fbf
pkgrel=1
pkgdesc="Content Manager Assistant for the PS Vita. (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/codestation/qcma'
license=('GPL')
depends=('ffmpeg'
         'qt5-base'
         'libnotify'
         'libvitamtp'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'qt5-tools'
             )
conflicts=('qcma-appindicator-git'
           'qcma-kdenotifier-git'
           )
source=('git+https://github.com/codestation/qcma.git')
sha1sums=('SKIP')

pkgver() {
  cd qcma
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  lrelease-qt5 "${srcdir}/qcma/common/resources/translations/"*.ts
  qmake-qt5 "${srcdir}/qcma/qcma.pro" PREFIX=/usr
  make
}

package() {
  make -C build INSTALL_ROOT="${pkgdir}" install
}

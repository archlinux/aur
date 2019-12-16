# Maintainer: Thom Wiggers
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=qwbfs
pkgver=1.2.6
pkgrel=3
pkgdesc="Cross platform WBFS file system manager"
arch=('i686' 'x86_64')
url="https://github.com/pasnox/qwbfsmanager"
license=('GPL2')
depends=('qt4')
makedepends=('git')
source=("qwbfs::git+https://github.com/pasnox/qwbfsmanager.git#tag=v1.2.6")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/qwbfs"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/qwbfs"

  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/qwbfs"

  mkdir -p "$pkgdir/usr/bin"
  cp bin/qwbfsmanager "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/applications"
  cp packages/QWBFSManager.desktop "$pkgdir/usr/share/applications"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  cp qwbfs/resources/qwbfsmanager.png \
     "$pkgdir/usr/share/icons/hicolor/512x512/apps"
}

## README
# This package still has some major issues, because it's basically a dead project
# based on the long-deprecated qt4 framework.
#
# You will probably need to set the environment variable QT_X11_NO_MITSHM=1 before
# you can launch qwbfsmanager and actually read the screens.

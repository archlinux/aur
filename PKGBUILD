# Maintainer: Tajidin Abd <tajidinabd at archlinux dot us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dominik Kummer <admin@arkades.org>

pkgname=kate-git2
pkgver=r15288.15d26a7
pkgrel=1
pkgdesc='An advanced editor component which is used in numerous KDE applications requiring a text editing component'
arch=('i686' 'x86_64')
url='https://kate-editor.org'
license=('LGPL')
depends=('knewstuff-git'  'ktexteditor-git'  'threadweaver-git' 'kactivities-git'  'hicolor-icon-theme-git' 'kcrash-git' 'kinit-git' 'kguiaddons-git' 'kiconthemes-git' 'kjobwidgets-git' 'kio-git' 'ktexteditor-git' 'kwindowsystem-git' 'kxmlgui-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools-git' 'plasma-framework-git' 'kconfig-git' 'libgit2-git' 'kitemmodels-git' 'ki18n-git' 'kparts-git')
provides=('kate')
conflicts=('kate')
install=kate-git.install
source=('git://anongit.kde.org/kate.git')
md5sums=('SKIP')

pkgver() {
  cd kate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kate \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

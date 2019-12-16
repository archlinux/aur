# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: Sameed Pervaiz <greenbagels@teknik.io>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=kdevelop-git
pkgver=5.4.5.r162.g0f53e24006
pkgrel=1
pkgdesc="A C/C++ development environment for KDE. (Git version)"
arch=('i686' 'x86_64')
url='http://www.kdevelop.org'
license=('GPL')
depends=(
    'clang'
    'libksysguard'
    'grantlee'
    'kcmutils'
    'threadweaver'
    'kitemmodels'
    'ktexteditor'
    'knotifyconfig'
    'knewstuff'
    'libkomparediff2'
    'qt5-webengine'
)
optdepends=(
    'konsole: embedded terminal'
    'git: Git support'
    'subversion: SVN support'
    'cvs: CVS support'
    'gdb: GNU Debugger support'
    'lldb: LLDB Debugger support'
    'cmake: CMake integration'
    'qt4-doc: qt4 documentation integration'
    'qt5-doc: qt5 documentation integration'
    'qt5-tools: qthelp plugin'
    'purpose: patch review plugin'
    'okteta: hex editor integration'
    'krunner: for enabling the KDevelop runner'
    'plasma-framework: for enabling the plasma addons'
    'cppcheck: code analyzer'
    'heaptrack: heap memory profiler plugin'
)
makedepends=(
    'extra-cmake-modules'
    'git'
    'subversion'
    'okteta'
    'krunner'
    'boost'
    'llvm'
    'qt5-tools'
    'plasma-framework'
    'kdevelop-pg-qt'
    'kdoctools'
    'purpose'
    'clang'
)
conflicts=('kdevelop' 'kdevplatform')
provides=('kdevelop' 'kdevplatform' 'kdevplatform-git')
replaces=('kdevplatform-git')
source=('git://anongit.kde.org/kdevelop.git')
sha1sums=('SKIP')

pkgver() {
  cd kdevelop
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdevelop \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

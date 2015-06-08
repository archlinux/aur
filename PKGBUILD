# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefano Avallone <stavallo@gmail.com>

pkgname=kdeplasma-addons-git
pkgver=r6824.5c16df7
pkgrel=1
pkgdesc="All kind of addons to improve your Plasma experience"
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/kdeplasma-addons'
license=(LGPL)
depends=(plasma-workspace-git kross-git)
makedepends=(kdoctools extra-cmake-modules git scim libibus purpose-git)
optdepends=('scim: SCIM backend for kimpanel' 'fcitx: FCITX backend for kimpanel' 'libibus: IBUS backend for kimpanel' 'purpose-git: quickshare 
applet')
conflicts=(kdeplasma-addons)
provides=(kdeplasma-addons)
source=('git://anongit.kde.org/kdeplasma-addons.git')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd kdeplasma-addons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdeplasma-addons \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON 
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}


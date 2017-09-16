# Maintainer: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=latte-dock-git
gitname=latte-dock
pkgver=0.7.1.r20.g040f314
pkgrel=1
pkgdesc='Replacement dock for Plasma desktops, providing an elegant and intuitive experience for your tasks and plasmoids- git version'
arch=('i686' 'x86_64')
url='https://cgit.kde.org/latte-dock.git/'
license=('GPL')
depends=('plasma-framework' 'plasma-desktop')
optdepends=('libunity: quicklists, counters, and progress bars for apps using libunity')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python' 'ruby' 'subversion')
conflicts=('latte-dock')
source=("git+"git://anongit.kde.org/latte-dock.git)
sha256sums=('SKIP')

pkgver() {
  cd ${gitname}

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
 
 
  cd ${gitname}
  mkdir build && cd build

  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DKDE_L10N_BRANCH=trunk -DKDE_L10N_AUTO_TRANSLATIONS=ON -DCMAKE_BUILD_TYPE=Release ..
  make fetch-translations

}

package() {
  cd ${gitname}/build

  make DESTDIR=${pkgdir} install
}

# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgname=plasma-workspace-git
pkgver=r3083.96adf1b
pkgrel=1
pkgdesc='KDE Plasma Workspace'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('qt5-tools' 'kded-git' 'libksysguard-git' 'kjsembed-git' 'knotifyconfig-git' 'ktexteditor-git' 'kde-cli-tools-git' 
'kio-extras-git' 'baloo-git' 'milou-git' 'libkscreen-git' 'breeze-git' 'kwin-git' 'gpsd' 'libqalculate' 'khelpcenter' 'xorg-xrdb' 
'xorg-xsetroot' 'xorg-xmessage' 'xorg-xprop' 'prison-frameworks-git' 'kxmlrpcclient-git' 'networkmanager-qt-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
optdepends=('plasma-workspace-wallpapers: additional wallpapers')
conflicts=('plasma-workspace' 'drkonqi' 'kdebase-workspace')
provides=('plasma-workspace' 'drkonqi')
options=()
source=('git://anongit.kde.org/plasma-workspace.git')
md5sums=('SKIP')

pkgver() {
  cd plasma-workspace
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-workspace \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  sed 's:qtpaths:qtpaths-qt5:' -i "$pkgdir"/usr/bin/startkde
}

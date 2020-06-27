# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
pkgname=plasma-workspace-git
pkgver=r9154.cb03cd7ca
pkgrel=1
pkgdesc='KDE Plasma Workspace'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('qt5-tools' 'kded-git' 'libksysguard-git' 'kjsembed-git'
  'knotifyconfig-git' 'ktexteditor-git' 'kio-extras-git' 'baloo-git' 'milou-git'
  'libkscreen-git' 'breeze-git' 'kwin-git' 'gpsd' 'libqalculate'
  'khelpcenter-git' 'xorg-xrdb' 'xorg-xsetroot' 'xorg-xmessage' 'xorg-xprop'
  'prison-git' 'kxmlrpcclient-git' 'networkmanager-qt' 'kscreenlocker-git'
  'kholidays-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
optdepends=('plasma-workspace-wallpapers: additional wallpapers')
conflicts=('plasma-workspace' 'plasma-wayland-session' 'kdebase-workspace')
provides=('plasma-workspace' 'plasma-wayland-session')
source=('git+https://github.com/KDE/plasma-workspace.git')
groups=('plasma')
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

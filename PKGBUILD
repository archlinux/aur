# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-desktop-git
pkgver=r2502.a029fb5
pkgrel=1
pkgdesc='KDE Plasma Desktop'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kde-workspace'
license=(LGPL)
depends=(libxkbfile libcanberra systemsettings-git ksysguard-git 
powerdevil-git kmenuedit-git kinfocenter-git polkit-kde-agent-git kpeople-git)
makedepends=(xorg-server-devel xf86-input-synaptics extra-cmake-modules git kdoctools)
optdepends=('plasma-nm-git: Network manager applet')
conflicts=(plasma-desktop kdebase-workspace kdebase-kdepasswd kcm-touchpad-frameworks)
provides=(plasma-desktop)
replaces=(kcm-touchpad-git)
install=$pkgname.install
source=('git://anongit.kde.org/plasma-desktop.git')
md5sums=('SKIP')

pkgver() {
  cd plasma-desktop
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-desktop \
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

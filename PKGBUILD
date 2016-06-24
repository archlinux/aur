# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-desktop-git
pkgver=r3581.6455c02
pkgrel=2
pkgdesc='KDE Plasma Desktop'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kde-workspace'
license=(LGPL)
depends=(libxkbfile libcanberra systemsettings-git ksysguard-git kactivities-stats-git
powerdevil-git kmenuedit-git kinfocenter-git polkit-kde-agent-git kpeople-git qt5-graphicaleffects packagekit-qt5)
makedepends=(xorg-server-devel xf86-input-synaptics extra-cmake-modules-git git kdoctools-git scim libibus boost)
optdepends=('plasma-nm-git: Network manager applet' 'scim: SCIM backend for kimpanel'
	'fcitx: FCITX backend for kimpanel' 'libibus: IBUS backend for kimpanel')
conflicts=(plasma-desktop kdebase-workspace kdebase-kdepasswd kcm-touchpad-frameworks)
provides=(plasma-desktop)
replaces=(kcm-touchpad-git)
install=$pkgname.install
source=('git://anongit.kde.org/plasma-desktop.git')
groups=('plasma')
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# You can install/update Subtitle Composer from repository if you add following to /etc/pacman.conf
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=subtitlecomposer
pkgver=0.6.3
pkgrel=2
pkgdesc="A KDE subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/${pkgname}"
license=('GPL')
depends=('kcoreaddons' 'sonnet' 'kcodecs' 'kross' 'kxmlgui' 'ki18n' 'gstreamer')
makedepends=('extra-cmake-modules')
# Comment/uncomment the following dependencies to disable/enable
# building of plugins for MPV and Xine player backends.
makedepends+=('xine-lib')
makedepends+=('mpv')
install=${pkgname}.install
optdepends=('mpv: for MPV backend'
            'mplayer: for MPlayer backend'
            'xine-lib: for Xine backend'
            'ruby: for scripting'
            'python: for scripting')
source=("https://github.com/maxrd2/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5dd2a74f16bc3c0b8771690a0fdc0a6928c38578ad2d27a1c84df6890e41fbf8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# Maintainer: Sterophonick

pkgname=kaffeine-git
pkgver=r2134.f5e0f38
pkgrel=1
pkgdesc='KDE media player'
license=(GPL)
arch=(i686 x86_64)
url="http://kaffeine.kde.org"

depends=(hicolor-icon-theme
         glibc
         libstdc++
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kdbusaddons5
         ki18n5
         kio5
         kwidgetsaddons5
         kwindowsystem5
         kxmlgui5
         libvlc
         qt5-base
         solid5
         v4l-utils
         vlc-plugins-video-output)
makedepends=(extra-cmake-modules
             git
             libxss)


provides=('kaffeine')
conflicts=('kaffeine')
source=('git+https://invent.kde.org/multimedia/kaffeine')
md5sums=('SKIP')

pkgver() {
  cd kaffeine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd kaffeine

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd kaffeine

  DESTDIR="$pkgdir" cmake --install build
}

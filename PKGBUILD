# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=krdc-git
_pkgname=krdc
pkgver=24.01.90.r112.g7a0de69
pkgrel=1
pkgdesc='Remote Desktop Client'
url='https://apps.kde.org/krdc/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kactivities5
         kbookmarks5
         kcmutils5
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kdnssd5
         ki18n5
         kio5
         knotifications5
         knotifyconfig5
         kwidgetsaddons5
         kwallet5
         kxmlgui5
         qt5-base)
makedepends=(extra-cmake-modules
             freerdp2
             kdoctools5
             libvncserver)
optdepends=('libvncserver: VNC support'
            'libssh: VNC support'
            'freerdp2: RDP support'
            'keditbookmarks: to edit bookmarks')
groups=(kde-applications
        kde-network)
source=(git+https://invent.kde.org/network/krdc)
sha256sums=('SKIP')
provides=(${_pkgname})
conflicts=(${_pkgname})

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kcm-wacomtablet-frameworks-git
pkgver=471.7ca3077
pkgrel=1
epoch=1
pkgdesc="KDE GUI for the Wacom Linux Drivers (KF5 branch)"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/wacom+tablet?content=114856"
license=('GPL2')
depends=('plasma-framework' 'xf86-input-wacom')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdoctools' 'kdelibs4support')
conflicts=('kcm-wacomtablet')
source=('git://anongit.kde.org/wacomtablet#branch=kf5-port')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/wacomtablet"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/wacomtablet"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "$srcdir/wacomtablet"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

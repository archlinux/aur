# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kcm-wacomtablet-git
pkgver=585.4c1006a
pkgrel=1
epoch=1
pkgdesc="KDE GUI for the Wacom Linux Drivers"
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/1127862/"
license=('GPL')
depends=('plasma-framework' 'xf86-input-wacom')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdoctools')
provides=('kcm-wacomtablet')
conflicts=('kcm-wacomtablet')
replaces=('kcm-wacomtablet-frameworks-git')
source=('git://anongit.kde.org/wacomtablet.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/wacomtablet"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/wacomtablet"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/wacomtablet"

  make DESTDIR="$pkgdir" install
}


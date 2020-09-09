# Maintainer zan <zan@420blaze.it>
# Contributor Andrea Scarpino <andrea@archlinux.org>

pkgname=kdewebkit-git
_name=${pkgname%-git}
pkgver=r45.8f9e1ed
pkgrel=1
pkgdesc='KDE Webkit'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kdewebkit'
license=(LGPL)
depends=(qt5-webkit kparts-git)
makedepends=(extra-cmake-modules-git git python)
groups=(kf5)
conflicts=(kdewebkit)
provides=(kdewebkit)
source=("git+https://invent.kde.org/frameworks/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Merged with official ABS kactivitymanagerd PKGBUILD by João, 2021/02/02 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=kactivitymanagerd-git
pkgver=5.20.90_r1316.ge53f5dd
pkgrel=1
pkgdesc="System service to manage user's activities and track the usage patterns"
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kio-git)
makedepends=(git extra-cmake-modules-git boost)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

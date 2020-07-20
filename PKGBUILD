# Maintainer: zan <zan@420blaze.it>
# Contributor: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=milou-git
_name=${pkgname%-git}
pkgver=v5.18.90.r10.g7efea66
pkgrel=1
pkgdesc="A dedicated search application built on top of Baloo"
arch=(x86_64)
url='https://invent.kde.org/plasma/milou'
license=(LGPL)
provides=(milou)
conflicts=(milou)
groups=(plasma)
depends=(krunner)
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=("git+https://invent.kde.org/plasma/$_name.git")
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

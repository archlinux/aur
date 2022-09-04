# Maintainer: Melanie Scheirer <mel@nie.rs>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kimageformats
pkgname=$_pkgname-git
pkgver=r424.43543f9
pkgrel=1
pkgdesc='Image format plugins for Qt5'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(qt5-base openexr)
makedepends=(extra-cmake-modules git karchive)
optdepends=('karchive: plugin for Krita and OpenRaster images')
groups=(kf5)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+https://github.com/KDE/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DKIMAGEFORMATS_HEIF=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: João Figueiredo <jf dot mundox at gmail dot com> (29/05/2020)
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stefano Zamprogno <stefano dot zamprogno at gmail dot com>

pkgname=knemo
pkgver=0.7.7.git20151003
pkgrel=5
pkgdesc="The KDE Network Monitor"
arch=('x86_64')
url="https://www.linux-apps.com/content/show.php?content=12956"
license=('GPL')
depends=('kdelibs4support' 'libksysguard' 'knotifyconfig' 'wireless_tools' 'iw' 'plasma-framework' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kcmutils' 'plasma-framework' 'kdoctools' 'git' 'kdesignerplugin' 'kinit')
options=('libtool')
#source=(https://kde-apps.org/CONTENT/content-files/12956-${pkgname}-${pkgver}.tar.xz)
_commit=f3afe2e4b6f091f21a64905965abafd2ef46826d  # frameworks
source=("git://git.kde.org/knemo.git#commit=$_commit" knemo-gcc6.patch)
sha256sums=('SKIP'
            '5da88c3c60bf7ab924c85ee2c1159a12d4c376ad726eab784972abc36295a4fc')

prepare() {
  mkdir build

  cd knemo
# Fix build with GCC 6
  patch -p1 -i ../knemo-gcc6.patch
}

build() {
  cd build

  cmake ../${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

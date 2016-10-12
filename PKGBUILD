# Maintainer: Bartosz Slawianowski <me2.legion at gmail dot com>
pkgname=audiothumbs-frameworks-git
pkgver=r5.d10c667
pkgrel=1
pkgdesc="Plugin for KDE file managers (Dolphin and Konqueror) to preview cover arts embedded in audio (MP3, FLAC, OGG, M4A) files tags as thumbnails."
arch=('i686' 'x86_64')
url="https://github.com/eplightning/audiothumbs-frameworks"
depends=('taglib' 'kio')
makedepends=('extra-cmake-modules' 'git' 'flac')
provides=('audiothumbs-frameworks')
conflicts=('audiothumbs-frameworks')
source=("git://github.com/eplightning/audiothumbs-frameworks.git")
license=('LGPL')
md5sums=('SKIP')

pkgver() {
  cd audiothumbs-frameworks
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../audiothumbs-frameworks \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

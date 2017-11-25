# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=peek
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple screen recorder with an easy to use interface"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
depends=(gtk3 libkeybinder3 ffmpeg)
makedepends=(cmake vala gettext txt2man)
optdepends=(
  'gst-plugins-good: WebM output under Gnome Shell'
  'gst-plugins-ugly: MP4 output under Gnome Shell'
  'gifski: High quality GIF animations with thousands of colors'
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/phw/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d6117baca6810d846831653023eb0517138a435a0f85fea9fc1c28421c0ccb2b')

prepare() {
  mkdir -p build
}

build() {
  cd "build"
  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DGSETTINGS_COMPILE=OFF \
    -DENABLE_FILECHOOSERNATIVE=ON
  make
}

check() {
  cd "build"
  make test
}

package() {
  cd "build"
  make DESTDIR=${pkgdir} install
}

# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=peek
pkgver=1.1.0
pkgrel=2
pkgdesc="Simple screen recorder with an easy to use interface"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
depends=(gtk3 libkeybinder3 ffmpeg imagemagick)
makedepends=(cmake vala gettext txt2man)
optdepends=(
  'gst-plugins-good: WebM output under Gnome Shell'
  'gst-plugins-ugly: MP4 output under Gnome Shell'
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/phw/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('3e34be130c43653e849efe9e3e08e446880c11aaf47ec4c62b54c5c5092f4cf9')

prepare() {
  mkdir -p build
}

build() {
  cd "build"
  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DGSETTINGS_COMPILE=OFF
  make
}

check() {
  cd "build"
  #make test
}

package() {
  cd "build"
  make DESTDIR=${pkgdir} install
}

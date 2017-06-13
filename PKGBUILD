# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=peek
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple animated GIF screen recorder with an easy to use interface"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
depends=(gtk3 libkeybinder3 ffmpeg imagemagick)
makedepends=(cmake vala gettext txt2man)
optdepends=(
  'gst-plugins-good: WebM output under Gnome Shell'
  'gst-plugins-ugly: MP4 output under Gnome Shell'
)
source=(git+https://github.com/phw/${pkgname}.git#tag=v${pkgver})
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DGSETTINGS_COMPILE=OFF .
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  #make test
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR=${pkgdir} install
}

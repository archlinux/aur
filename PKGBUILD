# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=peek
pkgver=1.0.3
pkgrel=1
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
source=(${pkgname}-${pkgver}::git+https://github.com/phw/${pkgname}.git#tag=v${pkgver})
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DGSETTINGS_COMPILE=OFF .
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

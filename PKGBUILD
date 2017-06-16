# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
_pkgname=peek
pkgname=peek-git
pkgver=1.0.3.r0.g257e5e3
pkgrel=1
pkgdesc="Simple screen recorder with an easy to use interface (latest development release)"
arch=('i686' 'x86_64')
url="https://github.com/phw/peek"
license=('GPL3')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(gtk3 libkeybinder3 ffmpeg imagemagick)
makedepends=(cmake vala gettext txt2man)
optdepends=(
  'gst-plugins-good: WebM output under Gnome Shell'
  'gst-plugins-ugly: MP4 output under Gnome Shell'
)
source=(${_pkgname}-${pkgver}::git+https://github.com/phw/${_pkgname}.git)
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DGSETTINGS_COMPILE=OFF .
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

pkgver() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

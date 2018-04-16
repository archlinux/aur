# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=pencil2d
pkgver=0.6.1
pkgrel=1
pkgdesc="An easy, intuitive tool to make 2D hand-drawn animations"
arch=('x86_64' 'i686')
url="https://pencil2d.org/"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-xmlpatterns' 'hicolor-icon-theme' 'ffmpeg')
source=("https://github.com/pencil2d/pencil/archive/v${pkgver}.tar.gz"
        "https://github.com/pencil2d/pencil/pull/946.patch")
md5sums=('4a9804e7e2cdf37173bc8471dc5e21c8'
         '0fb639286ec40bdc6d050487063a42da')

prepare() {
  cd "${srcdir}/pencil-${pkgver}"

  patch -Np1 < "${srcdir}/946.patch"
}

build() {
  cd "${srcdir}/pencil-${pkgver}"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/pencil-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"
}

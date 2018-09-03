# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=luminancehdr-git
pkgver=2.5.1.r245.g7dc448a6
pkgrel=1
pkgdesc='Open source graphical user interface application that aims to provide a workflow for HDR imaging'
arch=('x86_64')
url='http://qtpfsgui.sourceforge.net/'
license=('GPL')
depends=('exiv2' 'fftw' 'gsl' 'lcms2' 'libraw' 'openexr' 'qt5-webengine' 'qt5-svg'
         'qt5-webkit' 'ccfits' 'desktop-file-utils' 'hicolor-icon-theme' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'gtest' 'qt5-tools' 'patch')
optdepends=('hugin: align image stack functionality')
provides=('luminancehdr')
conflicts=('luminancehdr')
options=('!emptydirs')
source=('git+https://github.com/LuminanceHDR/LuminanceHDR.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}"/LuminanceHDR
  git describe --long | sed 's/^v\.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/LuminanceHDR

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/LuminanceHDR

  make DESTDIR="${pkgdir}" install
}

# Maintainer:   Anton Kudelin <kudelin at protonmail dot com>
# Contributor:  Ross Whitfield <whitfieldre@ornl.gov>
# Contributor:  Brian Lam <blamm9[at]gmail[dot]com>
# Contributor:  AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor:  Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>

pkgname=ovito
pkgver=3.3.1
pkgrel=2
pkgdesc="Open Visualization Tool"
url="http://www.ovito.org"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'python' 'netcdf' 'ffmpeg' 'qt5-base')
makedepends=('cmake' 'boost' 'qscintilla-qt5' 'qt5-svg' 'libxslt')
conflicts=("$pkgname-git")
source=("https://gitlab.com/stuko/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('d904b495467c17affaf171aa1be86e9ecd37a8e7328d94d5f9a6d93563a335de')

prepare() {
  mkdir "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-v$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DOpenGL_GL_PREFERENCE=GLVND \
      -DOVITO_BUILD_DOCUMENTATION=ON
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}

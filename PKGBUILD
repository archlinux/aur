# Maintainer: Augusto Borges <aborges@iflysib.unlp.edu.ar>
# Contributor: Emanuel Cura Costa <ecuracosta@gmail.com>
# Contributor: Gerhard Burger <burger.ga@gmail.com>

pkgname=morpheus-modeling
pkgver=2.1.1
pkgrel=1
pkgdesc="A modeling and simulation environment for the study of multiscale and multicellular systems."
arch=('x86_64')
url="https://morpheus.gitlab.io"
license=('BSD')
depends=('zlib' 'libtiff' 'graphviz' 'qt4' 'sqlite' 'qtwebkit' 'libsbml')
makedepends=('gcc>=4.6' 'cmake>=2.8' 'libxslt' 'doxygen' 'git' 'boost' 'libxml2')
optdepends=("gnuplot: Used for generating graphics"
            "ffmpeg: Used for generating movies" )
source=("$pkgname-$pkgver::git+https://gitlab.com/morpheus.lab/morpheus.git#tag=v$pkgver")
noextract=()
md5sums=('SKIP')

build() {
  mkdir -p "$pkgname-$pkgver/build"
  cd "$pkgname-$pkgver/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  make DESTDIR="$pkgdir" install
}

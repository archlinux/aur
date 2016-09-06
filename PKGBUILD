# Maintainer: Augusto Borges <aborges@iflysib.unlp.edu.ar>
# Contributor: Emanuel Cura Costa <ecuracosta@gmail.com>
pkgname=morpheus-modeling
pkgver=2.0
pkgrel=2
pkgdesc="It's a modeling and simulation environment for the study of multiscale and multicellular systems."
arch=('i686' 'x86_64')
url="https://imc.zih.tu-dresden.de/wiki/morpheus"
license=('BSD')
depends=('zlib' 'libtiff' 'graphviz' 'qt4' 'sqlite' 'qtwebkit')
makedepends=('gcc>=4.6' 'cmake>=1.8' 'libxslt' 'doxygen' 'git' 'qt5-svg')
optdepends=("libxml2: "
            "gnuplot: Used for generating graphics"
            "ffmpeg: Used for generating movies" )
source=("$pkgname-$pkgver::git+https://gitlab.com/morpheus.lab/morpheus.git")
noextract=()
md5sums=('SKIP')

build() {
  if ! test -e "$pkgname-$pkgver"; then
    mkdir "$pkgname-$pkgver";
  fi
  cd "$pkgname-$pkgver"
  if ! test -e "build"; then
    mkdir "build";
  fi
  cp "../../CMakeLists.txt" "3rdparty/CMakeLists.txt"
  sed -e '3s/# //' CMakeLists.txt > temporal.txt
  mv temporal.txt CMakeLists.txt
  cd "morpheus/core"
  sed -e '3s/# //' CMakeLists.txt > temporal.txt
  mv temporal.txt CMakeLists.txt

  cd "../.."
  cd "build"
  cmake ..
}

package() {
  cd "$pkgname-$pkgver"
  cd "build"
  pwd
  make && make DESTDIR="$pkgdir" install
}

# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=icet
_pkgname=IceT
pkgver=2.1.1
_pkgver=${pkgver//./-}
pkgrel=5
pkgdesc='High-performance sort-last parallel rendering library'
arch=('x86_64')
url='http://icet.sandia.gov'
license=('BSD')
depends=('openmpi' 'libglvnd')
makedepends=('cmake' 'freeglut' 'glu')
source=("$url/_assets/files/$_pkgname-$_pkgver.tar.gz"
        "LICENSE")
sha256sums=('6eaf0442bf6832ce6c8a50805cf9279894fbcd5886cf6ea214b09d24f111fa33'
            '536d0d708b435047bf3ef8a48d5c19354b9553b948f240df2802cd6480d468e9')

prepare(){
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$_pkgname-$_pkgver \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DICET_USE_OPENGL=ON \
    -DICET_USE_MPI=ON \
    -DOpenGL_GL_PREFERENCE=GLVND
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

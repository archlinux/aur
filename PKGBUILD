# Maintainer: evorster <evorster@gmail.com>
# Contributor: ZKenJ <zkenjm@gmail.com>
# Contributor: Cilyan
# Contributor: Dan Serban
# Contributor: sjewo
# Contributor: Theo Nicolau


pkgname=slowmovideo-git
pkgver=20150423
pkgrel=1
pkgdesc="Video slow motion effect via interpolation"
arch=('i686' 'x86_64')
url="http://slowmovideo.granjow.net/index.html"
license=('GPL')
depends=('glew' 'opencv' 'qt5-script' 'xdg-utils' 'desktop-file-utils')
makedepends=('cmake' 'git')
provides=('slowmovideo')
conflicts=('slowmovideo')
source=('git+https://github.com/slowmoVideo/slowmoVideo.git')
md5sums=('SKIP')
install=$pkgname.install

#prepare(){
#cd ${srcdir}/slowmoVideo
#patch -p1 -i ../../${pkgname}.patch
#}

pkgver() {
  cd "${srcdir}"/slowmoVideo
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd "${srcdir}/slowmoVideo"
  mkdir build && cd build
  export LDFLAGS="-lX11 ${LDFLAGS}"
  cmake -DUSE_QTKIT=FALSE -DENABLE_TESTS=FALSE -DCMAKE_INSTALL_PREFIX=/usr ../src
  make
}

package() {
  cd "${srcdir}/slowmoVideo/build"
  make DESTDIR="${pkgdir}" install
}

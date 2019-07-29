# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Snaipe

pkgname=criterion
pkgver=2.3.3
_fullver=2.3.3
pkgrel=1
pkgdesc="A KISS, non-intrusive unit testing framework for C and C++"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/${pkgname}.git"
license=('MIT')
depends=('gettext' 'nanomsg' 'libcsptr')
makedepends=('cmake')
checkdepends=('python-cram')
source=("$pkgname"::"git://github.com/Snaipe/${pkgname}.git#tag=v${_fullver}")
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  mkdir -p "build"
  cd "build"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd ${srcdir}/${pkgname}/build
  make DESTDIR=$pkgdir LIBDIR=$pkgdir/usr/lib install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

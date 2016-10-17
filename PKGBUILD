# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdesrc-build
pkgver=16.10
pkgrel=1
pkgdesc="A script to build KDE software from KDE's source repositories"
url='http://kdesrc-build.kde.org/'
arch=('any')
license=('GPL')
depends=('perl' 'perl-libwww' 'perl-xml-parser' 'dialog' 'perl-json')
makedepends=('cmake')
optdepends=('subversion: download source code using svn'
            'git: download source code using git')
source=("${pkgname}-${pkgver}.tar.gz"::"http://quickgit.kde.org/?p=kdesrc-build.git&a=snapshot&h=f187eaf9ff7b3994de649377abf18f131fee03ef&fmt=tgz")
md5sums=('b1990b271ebc851db8862b49bd317d90')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesrc-build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/doc/samples
  install -Dm644 ../kdesrc-build/kdesrc-buildrc-{,kf5-}sample \
    "${pkgdir}"/usr/share/doc/samples/
  install -Dm644 ../kdesrc-build/kf5-{applications,frameworks,kdepim,qt5,workspace}-build-include \
    "${pkgdir}"/usr/share/doc/samples/
}

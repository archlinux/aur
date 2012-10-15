# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=graspit
pkgver=2.2
pkgrel=1
pkgdesc="Environment for grasp analysis and planning."
arch=('i686' 'x86_64')
url="http://www.cs.columbia.edu/~cmatei/graspit/"
license=('GPL')
depends=('qhull' 'soqt' 'lapack')
source=(http://downloads.sourceforge.net/project/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('608dbe0ef3e610bcd2870414e6ad5476')
sha256sums=('98eee3dd647032eb1e4d42f35bc449f8f8611d184437506b15b76a51a11cf568')
sha384sums=('cdf0c4ffd16fcca564f223506abc57aea47eef358a5e6978b19a146da33e3eb2bf2a8d06f6174a711e5f2f463f5a4a31')
sha512sums=('065f5be25ea28740797db61069156edbf56b0198527d5f99e543c5882430d5ed9aebfecfbbdf0ea62ed4ba34320c155536ec7877f6356df5e9f0e451d3105455')

build() {
  cd "${srcdir}/Graspit"

  sed 's#models/#/usr/share/graspit/models/#g' -i worlds/*

  qmake graspit.pro EXT_DESTDIR="${pkgdir}/usr/bin" INCLUDEPATH=/usr/include/libqhull LIBS=-ldl
  make
}

package() {
  cd "${srcdir}/Graspit"

  make install
  install -dm755 "${pkgdir}/usr/share/graspit"
  cp -r models "${pkgdir}/usr/share/graspit/"
  cp -r worlds "${pkgdir}/usr/share/graspit/"
}


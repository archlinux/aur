# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=graspit
pkgver=2.2
pkgrel=2
pkgdesc="Environment for grasp analysis and planning."
arch=('i686' 'x86_64')
url="http://www.cs.columbia.edu/~cmatei/graspit/"
license=('GPL')
depends=('qhull' 'soqt' 'lapack')
source=(http://downloads.sourceforge.net/project/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz
        graspit)
md5sums=('608dbe0ef3e610bcd2870414e6ad5476'
         'b5d26b2f067755e7f8273da73fa949a4')
sha256sums=('98eee3dd647032eb1e4d42f35bc449f8f8611d184437506b15b76a51a11cf568'
            '25d515770a7bbc0078dcfe036683370ab33b8a35b2c01448bcd0ae8bbbba1ef5')
sha384sums=('cdf0c4ffd16fcca564f223506abc57aea47eef358a5e6978b19a146da33e3eb2bf2a8d06f6174a711e5f2f463f5a4a31'
            '775e3770092c203f7f39239eadb2b64cb6fa7b298ba27a94b97a4ceca70f3a14bfb9459cd66367c5d18a2eea24274d80')
sha512sums=('065f5be25ea28740797db61069156edbf56b0198527d5f99e543c5882430d5ed9aebfecfbbdf0ea62ed4ba34320c155536ec7877f6356df5e9f0e451d3105455'
            '10076b2b37774aade749906de59b077a3aaed8ff90ccc3fa4221aa508792b55492c27a382d0ee14f8860fd18d817b6ea746891e58524e43977653939da9951a8')

build() {
  cd "${srcdir}/Graspit"

  qmake graspit.pro EXT_DESTDIR="${pkgdir}/usr/share/graspit" ADDITIONAL_INCLUDE_DIR=/usr/include/libqhull ADDITIONAL_LINK_FLAGS=-ldl
  make
}

package() {
  cd "${srcdir}/Graspit"

  make install

  # include 3D models and worlds
  install -dm755 "${pkgdir}/usr/share/graspit"
  cp -r models "${pkgdir}/usr/share/graspit/"
  cp -r worlds "${pkgdir}/usr/share/graspit/"

  # include all header files
  install -dm755 "${pkgdir}/usr/include/graspit"
  cp -r include/* "${pkgdir}/usr/include/graspit/"

  # create a directory for plugins
  install -dm755 "${pkgdir}/usr/share/graspit/plugin"

  # install a shell script that intializes environment variables
  # and starts graspit
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/graspit" "${pkgdir}/usr/bin"
}


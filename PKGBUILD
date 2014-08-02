# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect
pkgver=0.5.0
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('GPL')
depends=('libusb' 'glu' 'freeglut' 'bash' 'python2')
makedepends=('cmake' 'libxmu' 'python2-numpy')
optdepends=('opencv: support for python demos'
            'python2-matplotlib: support for python demos')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKinect/libfreenect/archive/v${pkgver}.tar.gz)
md5sums=('db2fdf870bbcb443d028b5af772197d7')
sha256sums=('34697e37637730778e2c4aed1f583f7f31e759e165b370a6b1c49fa3a533073c')
sha384sums=('40210a3429dd02d33ea091d335ca5869e364e48b6710d79d735664d244cae01cbdbe073a1b3cf58490ba7a5fc8876080')
sha512sums=('25538287d5c2fbdc27e6ac546a40413a70c7fb80cd7de6bc47e56350fa43e9daa60280c478e48182a806010ead071755731114de5fac3c4fdbc90119ec89751c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPython_ADDITIONAL_VERSIONS="2.7;2.6;2.5;2.4;2.3;2.2;2.1;2.0" .

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}

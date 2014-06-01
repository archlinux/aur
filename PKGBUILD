# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect
pkgver=0.4.3
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
md5sums=('751ee097a4dc3ecc0f412d6592f14858')
sha256sums=('65a67ae16c0c5c39ab33302a5d25bfe126b69bdf19063eb526db908f912c6410')
sha384sums=('a451927e6c1382651ecd6bd0dda8b5a55699fad4113b20aa40aa9ec5f48f559fa87d97e06e355712c69b573d070d6253')
sha512sums=('3139d29d6dd39b51a4c75bf95097f59f4fd7feb85fcfa7c999987c1c11fde8c4977380fa28d7c83ae54e32ba23488950a6a8bb1ebff09a69c465a42e4dba6c6b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" \
    -DBUILD_AUDIO=ON \
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

# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect
pkgver=0.4.0
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
md5sums=(dcc66679e6c82612f8d1187e606277c2)
sha256sums=(291da3812dfa7bea70b19ca3dc51bce8d403c21e0a11ca57641f4df1392c40a8)
sha384sums=(0baa8bdc8cf89175e43c004c24a91ec62198795973a2b4e8c90787a4d4924a3edde45f2959d311754f0bc464d113333a)
sha512sums=(d7ec3425c73e2a863e6a5880e85cf559dfe0b08e03b8851bde40afcfc9c2fc9a84eb941cda0a4de6e3a1bd31a2d272bf566c8f34588f0b66bd3986502f9bd7fd)

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

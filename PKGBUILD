# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.6.1
pkgrel=2
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL3)
depends=(ffmpeg libopenshot libopenshot-audio python-pyqt5 python-pyzmq
python-requests qt5-base qt5-svg qt5-webkit)
makedepends=(python-setuptools)
optdepends=('faac: for exporting audio using AAC')
source=(https://github.com/OpenShot/openshot-qt/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('9e2d1eae5d72ec2deab914e464dac0d84a864ba2ca63104fad57c90fc907764d5683149fb8136d50030cae993cef9a977e995b0783868988de4668e71a3a5ee2')
b2sums=('b3a163983bdb811103e5d9307beeb38938719747f743dd58520a0166c08eb11f4592d47bf24224062f9db323a66a2f353eb22f087982b929d60a519cd2c40789')

build() {
  cd ${pkgname}-qt-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-qt-${pkgver}
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README}.md} \
    -t "${pkgdir}"/usr/share/doc/${pkgname}
}

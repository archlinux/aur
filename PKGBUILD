# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.5.1
pkgrel=3
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL3)
depends=(ffmpeg mlt python-pyqt5 python-requests python-setuptools libopenshot
         libopenshot-audio python-pyzmq qt5-base qt5-svg qt5-webkit)
optdepends=('faac: for exporting audio using AAC')
source=(https://github.com/OpenShot/openshot-qt/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('8254a45254bbe523b6485b9598022de2c46ec30818e606ac4665790d29486693c4efe9f5bc55ee43d6342de6782cf0090e4bc880e831c08e3b1218bca555af14')

build() {
  cd ${pkgname}-qt-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-qt-${pkgver}
  python setup.py install --skip-build \
                          --optimize=1 \
                          --prefix=/usr \
                          --root="${pkgdir}"
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README}.md} \
    -t "${pkgdir}"/usr/share/doc/${pkgname}
}

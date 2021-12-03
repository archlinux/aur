# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.6.1
pkgrel=4
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL3)
depends=(ffmpeg libopenshot libopenshot-audio python-pyqt5 python-pyzmq
python-requests qt5-base qt5-svg qt5-webkit)
makedepends=(python-setuptools)
optdepends=('faac: for exporting audio using AAC')
source=(
  https://github.com/OpenShot/openshot-qt/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
  "${pkgname}-2.6.1-no_metric_default.patch"
)
sha512sums=('9e2d1eae5d72ec2deab914e464dac0d84a864ba2ca63104fad57c90fc907764d5683149fb8136d50030cae993cef9a977e995b0783868988de4668e71a3a5ee2'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')
b2sums=('b3a163983bdb811103e5d9307beeb38938719747f743dd58520a0166c08eb11f4592d47bf24224062f9db323a66a2f353eb22f087982b929d60a519cd2c40789'
        '6f75f37be8d3e03090a8ca53e645b3269f92c7f44aa39cfbe1a03266a36d508d5c18eebbb5792ed9d6d031b3694902bc3fa3a2dac745aad60b2bc331657a364a')

prepare() {
  cd ${pkgname}-qt-${pkgver}
  patch -Np1 -i ../"${pkgname}-2.6.1-no_metric_default.patch"
}

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

# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.5.0
pkgrel=2
pkgdesc="An award-winning free and open-source video editor"
arch=('any')
url="https://www.openshot.org/"
license=('GPL3')
depends=('ffmpeg' 'mlt' 'python-pyqt5' 'python-requests' 'libopenshot'
'libopenshot-audio' 'python-pyzmq' 'qt5-base' 'qt5-svg' 'qt5-webkit')
optdepends=('faac: for exporting audio using AAC')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/openshot-qt/archive/v$pkgver.tar.gz")
sha512sums=('0944bff48c8957a4a3c5a37428b4d3e45e8ad6e1664812ea90b7c16d014a3c355daf2fe183ce855586114ccfa36c419b6baacc42c4bf871de29bda4c24f2a814')

prepare() {
  mv -v "${pkgname}-qt-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
                          --optimize=1 \
                          --prefix=/usr \
                          --root="${pkgdir}"
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

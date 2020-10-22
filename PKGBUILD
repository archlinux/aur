# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.5
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
url="https://github.com/metabrainz/picard"
license=('GPL2')
arch=('x86_64')
depends=('glibc' 'hicolor-icon-theme' 'python-dateutil' 'python-discid'
'python-markdown' 'python-mutagen' 'python-pyqt5')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('chromaprint: fingerprinting'
            'qt5-multimedia: media player toolbar'
            'qt5-translations: full UI translation')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('45aacdc6e1ea070b450eaad52caa3015a7ddacee875194d1af0f3d7323bfac0213d56b8106cf5f40f712d88cdd63e02cb3ac1a1834f7e1f224d0d4e58597ca85')
b2sums=('2d6fc572a4d429f716f5d7822d87d4e167bb36daa0816d542a231f4005ab3a72b001eb5739439112e98e2ffd78ebbc9dc16a1bd85b70aa1a1585a6b086d9d7df')
# NOTE: GPG signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
                          --optimize=1 \
                          --disable-autoupdate \
                          --root="${pkgdir}"
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

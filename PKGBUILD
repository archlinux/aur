# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.6.1
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
url="https://github.com/metabrainz/picard"
license=('GPL2')
arch=('x86_64')
depends=('glibc' 'hicolor-icon-theme' 'python-dateutil' 'python-discid'
'python-fasteners' 'python-markdown' 'python-mutagen' 'python-pyqt5')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('chromaprint: fingerprinting'
            'qt5-multimedia: media player toolbar'
            'qt5-translations: full UI translation')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('0f145011cbeaaa6b0764df7c95dbb1759cd2d512f8d93cbb4b1e7a7db35808de5bbb32096883e191d05e2a794f9639c13471ab40272f152794079c3da0a9216e'
            'SKIP')
b2sums=('8ef08ea90cc6a2c5375359b60595f24ebaefb6c7e5cf532acf36b2a66f70b03570408486cab9fcc26c64622cf3f274ded7de11dda1cc9d12843d61f7cdd702e1'
        'SKIP')
# NOTE: GPG signed tags and artifacts are being evaluated: https://tickets.metabrainz.org/browse/PICARD-1934
validpgpkeys=('68990DD0B1EDC129B856958167997E14D563DA7C') # MusicBrainz Picard Developers <picard@metabrainz.org>

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
